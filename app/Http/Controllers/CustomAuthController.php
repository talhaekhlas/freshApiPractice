<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\User;
use Auth;


class CustomAuthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
     {
        // $this->middleware('auth:api')->except('index','show');
     }


    public function loginTalha(Request $request)
    {
        $email = $request->email;
        $password = $request->password;
            if (Auth::attempt(array('email' => $email, 'password' => $password))){
            return "success";
            }
            else {        
                return "Wrong Credentials";
            }
        
        
        return $check = User::where('email',$request->email)->where('password',bcrypt($request->password))->first();
        return $request->all();
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        /**
         * Data not found
         */
        $data = [];
        $check = User::where('id',$id)->get();

        if(!count($check)){
            $data['message'] = 'Not Found';
            $data['status'] = Response::HTTP_NOT_FOUND;
            $data['data'] = [];

            return response($data, Response::HTTP_NOT_FOUND);
            
        }


        /**
         * Data found
         */
        $data['message'] = 'Data Found';
        $data['status'] = Response::HTTP_FOUND;
        $data['data'] = User::select('name','id')->where('id',$id)->first();

        return response($data, Response::HTTP_FOUND);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
