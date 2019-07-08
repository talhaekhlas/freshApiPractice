<?php

namespace App\Models;
use App\Models\Thana;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    public function thanas(){
        return $this->hasMany(Thana::class);
    }
}
