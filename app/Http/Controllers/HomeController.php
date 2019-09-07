<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Symfony\Component\HttpFoundation\Response;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth:api')->except('show');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // $role = Role::create(['name' => 'editor']);
        // $permission = Permission::create(['name' => 'edit articles']);

        // return 0;

        // $user = Auth::user();

        // return $user->givePermissionTo('edit articles', 'delete articles');

        //return 0;


        return view('home');
    }

    public function userList()
    {
        $data['message'] = 'All User';
        $data['total'] = User::count();
        $data['data'] = User::orderBy('id','desc')->get();

        return response($data, Response::HTTP_OK);
    }
}
