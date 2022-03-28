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
        $posts = $postRepo->findAll();
        return $this->render('home/index.html.twig', [
            'posts' => $posts,
            'cats' => $cats,
        ]);
    }
}
