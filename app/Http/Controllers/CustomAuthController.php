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
         if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user(); 
            $responseData['error'] = false;
            // $responseData['status'] = $this->successStatus;
            $responseData['resMsg'] = "You have logged in successfully.";
            $responseData['user'] = $user;
            $responseData['token'] = $user->createToken('MyApp')->accessToken;
            
            return response()->json($responseData); 
        } 
        else{ 
            $responseData['error'] = true;
            $responseData['status'] = 401;
            $responseData['resMsg'] = "Unauthorised.";
            
            return response()->json($responseData); 
        } 
    }


    public function registerTalha(Request $request)
    {


        if($request->password == $request->confirm_password){

            

            $checkExist = User::where('email',$request->email)->get();

            if(count($checkExist)){

                $responseData['message'] = 'Duplicate Entry';
                $responseData['data'] = [];
                return response($responseData, Response::HTTP_OK);
            }

            $data = $request->except(['corfirm_password']);

            $data['password'] = bcrypt($request->password);
 
            $user  = User::create($data);


            $responseData['message'] = 'Successfully Inserted';

            $responseData['data'] = $user;
            
            return response($responseData, Response::HTTP_OK);
        }else{
            $responseData['message'] = 'Password Mismatch';
            $responseData['data'] = [];
            return response($responseData, Response::HTTP_NOT_FOUND);
        }
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


    public function duplicateCheck(Request $request)
    {
        $duplicateCheck = User::where('email',$request->email)->get();

        if(count($duplicateCheck)){
            return 'duplicate';
        }else{
            return 'no';
        }
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
