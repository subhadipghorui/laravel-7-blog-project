<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{

    public function user()
    {
        return $this->belongsTo('App\User'); // user_id
    }
    public function category()
    {
        return $this->belongsTo('App\Category'); // category_id
    }
    public function tags()
    {
        return $this->hasMany('App\Tag', 'postID', 'id');
    }
    public function comments()
    {
        return $this->hasMany('App\Comment');
    }

    // Define Scope
    // published()
    public function scopePublished($query)
    {
        return $query->where('status', 1);
    }

    // many to many
    public function likedUsers()
    {
        return $this->belongsToMany('App\User')->withTimestamps();
    }
}
