<?php

use App\Category;
use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::create([
            'name' => 'HTML',
            'slug' => 'html',
            'description' => 'html',
            'image' => 'html.JPG',
        ]);
        Category::create([
            'name' => 'CSS',
            'slug' => 'css',
            'description' => 'css',
            'image' => 'css.JPG',
        ]);
        Category::create([
            'name' => 'Javascript',
            'slug' => 'javascript',
            'description' => 'javascript',
            'image' => 'javascript.JPG',
        ]);
        Category::create([
            'name' => 'GIS and Remote Sensing',
            'slug' => 'gis',
            'description' => 'gis',
            'image' => 'gis.JPG',
        ]);
        Category::create([
            'name' => 'Data Base',
            'slug' => 'mysql',
            'description' => 'mysql',
            'image' => 'mysql.JPG',
        ]);
        Category::create([
            'name' => 'Arduino',
            'slug' => 'arduino',
            'description' => 'arduino',
            'image' => 'arduino.JPG',
        ]);
        Category::create([
            'name' => 'Web Mapping',
            'slug' => 'webmapping',
            'description' => 'webmapping',
            'image' => 'webmapping.JPG',
        ]);
        Category::create([
            'name' => 'Web Designe',
            'slug' => 'webdesigne',
            'description' => 'webdesigne',
            'image' => 'webdesigne.JPG',
        ]);
    }
}
