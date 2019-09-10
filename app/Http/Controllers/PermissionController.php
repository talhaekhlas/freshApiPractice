<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;

class PermissionController extends Controller
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
        $data['message'] = 'all permision';
        $data['total'] = Permission::count();
        $data['data'] = Permission::all();
        return response($data, Response::HTTP_OK);
    }

    public function permissionOfRole($roleId)
    {
        $permissionOfRole = DB::table('role_has_permissions')->where('role_id',$roleId)->pluck('permission_id');


        $data['message'] = "all permission of specific role";
        $data['total'] = count($permissionOfRole);
        $data['data'] = $permissionOfRole;
        return response($data, Response::HTTP_OK);
        
    }
    
    public function permissionSet(Request $request)
    {
        DB::table('role_has_permissions')->where('role_id',$request->roleId)->delete();
        foreach ($request->permission as $permissionId) {

            DB::table('role_has_permissions')->insert(
                ['role_id'=>$request->roleId,'permission_id'=>$permissionId]
            );
            
        }
        $data['message'] = "Permission set Successfully";
        return response($data, Response::HTTP_OK);
        
    }
    

    
}
