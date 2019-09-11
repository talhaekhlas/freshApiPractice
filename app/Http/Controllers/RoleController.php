<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use auth;
use App\User;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth:api')->except('show');
    }


    public function index()
    {
        $data['total'] = Role::count();
        $data['message'] = "all role";
        $data['data'] = Role::orderBy('id','desc')->get();
        return response($data, Response::HTTP_OK);
     }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $role = Role::create(['name' => $request->name]);
        $data['data'] = $role;
        $data['message'] = "Role Saved Successfully";
        return response($data, Response::HTTP_OK);
        return '{"name":"Role Test"}';
    }

   
    public function destroy($id)
    {
         /**
         * Data not found
         */
        $data = [];
        $check = Role::where('id',$id)->get();

        if(!count($check)){
            $data['message'] = 'Not Found';
            
            $data['data'] = [];

            return response($data, Response::HTTP_NOT_FOUND);
            
        }

        

        /**
         * Data Delete
         */
        
        Role::where('id',$id)->delete();
       
        $data['message'] = 'data deleted succesfully';
        $data['data'] = Role::orderBy('id','desc')->get();
        return response($data, Response::HTTP_OK);
    }



     public function roleOfUser($userId)
    {
        $roleOfUser = DB::table('model_has_roles')->where('model_id',$userId)->pluck('role_id');


        $data['message'] = "all role of specific user";
        $data['total'] = count($roleOfUser);
        $data['data'] = $roleOfUser;
        return response($data, Response::HTTP_OK);
        
    }
    
    public function roleSet(Request $request)
    {
        $user = User::find($request->userId);

        $user->syncRoles($request->role);

        $data['message'] = "role set Successfully";
        return response($data, Response::HTTP_OK);
        
    }
}
