<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Post;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

$factory->define(Post::class, function (Faker $faker) {
    return [
        'user_id' => 1,
        'category_id'=> random_int(1,8),
        'title' => $faker->sentence($nbWords = 10, $variableNbWords = true),
        'slug' => Str::slug($faker->sentence($nbWords = 10, $variableNbWords = true)),
        'image' => 'laravel-wiki-5f92a8e71c7bc1603447015.jpg',
        'body' => $faker->paragraph($nbSentences = 20, $variableNbSentences = true),
        'view_count' => random_int(10,100),
        'status' => 1
    ];
});
