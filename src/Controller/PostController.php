<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\User;
use App\Form\PostType;
use App\Entity\Category;
use App\Repository\PostRepository;
use App\Repository\UserRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class PostController extends AbstractController
{
    // #[Route('/post', name: 'index_post')]
    // public function index(PostRepository $postRepo): Response
    // {
    //     $posts = $postRepo->findAll();
    //     return $this->render('post/index.html.twig', [
    //         'posts' => $posts,
    //     ]);
    // }

    #[Route('/post/new', name: 'create_post')]
    #[IsGranted("ROLE_USER")]
    public function create(Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $post = new Post();
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $image = $form->get('image')->getData();
            if($image) {
                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $image->guessExtension();

                try {
                    $image->move(
                        $this->getParameter('upload_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                  // Si ça se passe mal, c'est ici qu'on redirige avec un message
                }
            }
            $entityManager = $doctrine->getManager();
            $post->setSlug(strtolower($slugger->slug($post->getTitle())));
            $post->setDate(new \DateTime);
            $post->setImage($newFilename);
            $post->setUser($this->getUser());
            $entityManager->persist($post);
            $entityManager->flush();
            return $this->redirectToRoute('home');
        } else {
            return $this->renderForm('post/create.html.twig', [
                'post_form' => $form,
                'title' => 'Créer un article'
            ]);
        }
    }

    #[Route('/post/show/{slug}', name: 'show_post')]
    public function viewSingle(Post $post): Response
    {
        return $this->render('post/detail.html.twig', [
            'post' => $post,
            'title' => $post->getTitle(),
        ]);
    }

    #[Route('/post/edit/{slug}', name: 'edit_post')]
    #[Security("is_granted('ROLE_ADMIN') or user==post.getUser()")]
    public function edit(Post $post, Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    { 
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            
            $image = $form->get('image')->getData();
            if($image) {
                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $image->guessExtension();

                try {
                    $image->move(
                        $this->getParameter('upload_directory'),
                        $newFilename
                    );
                    $post->setImage($newFilename);
                } catch (FileException $e) {
                  // Si ça se passe mal, c'est ici qu'on redirige avec un message
                }
               
            }
            $entityManager = $doctrine->getManager();
            $post->setSlug(strtolower($slugger->slug($post->getTitle())));
            $entityManager->flush();
            return $this->redirectToRoute('home');
        } else {
            return $this->renderForm('post/create.html.twig', [
                'post_form' => $form,
                'title' => 'Modifier un article'
            ]);
        }
    }

    #[Route('/post/delete/{slug}', name: 'delete_post')]
    #[Security("is_granted('ROLE_ADMIN') or user==post.getUser()")]
    public function delete(Post $post,  ManagerRegistry $doctrine): Response
    {
        $entityManager = $doctrine->getManager();
        $entityManager->getRepository(Post::class)->find($post->getSlug());
        $entityManager->remove($post);
        $entityManager->flush();
        return $this->redirectToRoute('home');
    }

    #[Route('/post/by/{date}', name: 'date_post')]
    public function byDate(string $date, PostRepository $postRepo) {

        $posts = $postRepo->findByDate($date);
        return $this->render('post/index.html.twig', [
            'posts' => $posts,
        ]);

    }

    #[Route('/post/category/{name}', name: 'category_post')]
    public function postsByCategory(Category $category = null, CategoryRepository $catRepo): Response
    {

        $cats = $catRepo->findAll();
        if ($category == null)
        {
            return $this->redirectToRoute('home');
        }

        $allPosts = $category->getPosts();
        return $this->render('home/index.html.twig', [
            'posts' => $allPosts,
            'cats' => $cats,
        ]);
    }

    #[Route('/post/user/{username}', name: 'username_post')]
    public function postsByUsername(User $user = null, CategoryRepository $catRepo): Response
    {

        $cats = $catRepo->findAll();
        if ($user == null)
        {
            return $this->redirectToRoute('home');
        }

        $allPosts = $user->getPosts();
        return $this->render('home/index.html.twig', [
            'posts' => $allPosts,
            'cats' => $cats,
        ]);
    }
    
    #[Route('/search', name: 'search_in_post')]
    public function search(Request $request, PostRepository $postRepo, CategoryRepository $catRepo): Response
    {

        $search = $request->query->get("search");
        $posts = $postRepo->searchPost($search);
        $cats = $catRepo->findAll();
        if ($posts) {
            return $this->render('home/index.html.twig', [
                'posts' => $posts,
                'cats' => $cats,
                'title' => 'Search',
            ]);
        } else {
            $posts = $postRepo->findAll();
            return $this->render('home/not_found.html.twig', [
                'posts' => $posts,
                'cats' => $cats,
                'title' => 'Erreur de recherche',
            ]);

        }
    }
}
