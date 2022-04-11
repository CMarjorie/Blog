<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(PostRepository $postRepo, CategoryRepository $catRepo): Response
    {
        $cats = $catRepo->findAll();
         $posts = $postRepo->findby([], ["date" => "DESC"], 5 );
        return $this->render('home/index.html.twig', [
            'posts' => $posts,
            'cats' => $cats,
        ]);
    }

    #[Route('/api/{number}', name: 'api')]
    public function api(int $number= 0, PostRepository $postRepo): Response
    {
        $posts = $postRepo->findby([], ["date" => "DESC"], 5, $number );
        return $this->render('home/api.html.twig', [
            'posts' => $posts,
            // 'number' => $number,
        ]);
    }

}
