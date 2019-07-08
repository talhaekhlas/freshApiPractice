<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TodoList extends Model
{
    protected $fillable = ['name','user_id'];
    protected $table = 'todo_lists';
}
