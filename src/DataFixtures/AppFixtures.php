<?php

namespace App\DataFixtures;

use Faker;
use Bluemmb;
use App\Entity\Post;
use App\Entity\User;
use App\Entity\Category;
use Bluemmb\Faker\PicsumPhotosProvider;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use PhpParser\Node\Expr\Cast\Object_;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Validator\Constraints\Length;

class AppFixtures extends Fixture
{
    private UserPasswordHasherInterface $hasher;
    private SluggerInterface $slugger;
    public function __construct(UserPasswordHasherInterface $hasher, SluggerInterface $slugger)
    {
        $this->hasher = $hasher;
        $this->slugger = $slugger;
    }


    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create();
        $faker->addProvider(new Bluemmb\Faker\PicsumPhotosProvider($faker));

        $categories = [];
        for ($j = 0; $j < 3; $j++) {
            $category = new Category();
            $category->setName($faker->word());
            $manager->persist($category);
            // array_push($categories, $category);
            $categories[]=$category;
        }

        for ($i = 0; $i < 5; $i++) {
            $user = new User();
            $user->setUsername($faker->userName());
            $user->setFirstname($faker->firstName());
            $user->setLastname($faker->lastName());
            $user->setEmail($faker->email());
            $password = $this->hasher->hashPassword($user, $faker->password());
            $user->setPassword($password);
            $manager->persist($user);

            for ($j = 0; $j <10; $j++){
                $post = new Post();
            $post->setTitle($faker->sentence());
            $post->setContent($faker->paragraph());
            $post->setDate($faker->dateTime());
            // foreach( $categories as $category){
            //     $post->addCategory($category);
            // }
            for ($k = 0; $k < rand(1, 3); $k++) {
                // $post->addCategory($categories[array_rand($categories)]);
                $post->addCategory($categories[rand(0,2)]);
                // $post->addCategory($categories[rand(0,count($categories)-1)]);
            }
            $post->setUser($user);
            $post->setImage($faker->imageUrl(800, 600, true));
            $post->setSlug(strtolower($this->slugger->slug($post->getTitle())));
            $manager->persist($post);
            }
        }


        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}
