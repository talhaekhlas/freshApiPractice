<?php

use Faker\Generator as Faker;

$factory->define(App\Models\TodoList::class, function (Faker $faker) {
    return [
        'name'=>$faker->name,
        'user_id'=>1
    ];
});
