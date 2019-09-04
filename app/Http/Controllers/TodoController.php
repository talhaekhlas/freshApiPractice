<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\TodoResource;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct()
     {
        // $this->middleware('auth:api')->except('show');
     }
    public function index(Request $request)
    {
        
        
        $limit = $request->limit;
        $skip = $request->page;


        /**
         * Data Without Pagination
         */
        if(!$request->limit || !$request->page){
            
            $data['total'] = Todo::select('id','name')->count();
            if($data['total']){
                $data['message'] = 'Data Found';
                $data['total'] = Todo::select('id','name')->count();
                $data['data'] = Todo::select('id','name')->get();
                return response($data, Response::HTTP_OK);

                
            }else{
                $data['message'] = 'Data Not Found';
                $data['total'] = Todo::select('id','name')->count();
                $data['data'] = Todo::select('id','name')->get();
                return response($data, Response::HTTP_NOT_FOUND);
                
            }

            

            
        }


        /**
         * Data With Pagination
         */
            
        $data['total'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get()->count();

        if($data['total']){
            $data['message'] = 'Data Found';
            $data['total'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get()->count();
            $data['data'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get();
            return response($data, Response::HTTP_FOUND);
            
        }else{
            $data['message'] = 'Data Not Found';
            $data['total'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get()->count();
            $data['data'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get();
            return response($data, Response::HTTP_NOT_FOUND);
            
        }

        

        
       
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [];
        /**
         * Data Validation
         */

        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:todos|max:20',
            'user_id' => 'required|exists:users,id',
            
        ]);

        $errors = $validator->errors();
        
        if($errors->first('name')){
            $data['name'] = $errors->first('name');
        }

        if($errors->first('user_id')){
            $data['user_id'] = $errors->first('user_id');
        }

        if(isset($data['name']) || isset($data['user_id'])){
           
            $data['message'] = 'Unprocessable Entity';
            $data['data'] = [];
            return response($data, Response::HTTP_UNPROCESSABLE_ENTITY);
        }


        /**
         * Data Save
         */

        
        $data['message'] = 'data inserted succesfully';
        $data['data'] = Todo::create($request->all());

        return response($data, Response::HTTP_OK);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        /**
         * Data not found
         */
        $data = [];
        $check = Todo::where('id',$id)->get();

        if(!count($check)){
            $data['message'] = 'Not Found';
            
            $data['data'] = [];

            return response($data, Response::HTTP_NOT_FOUND);
            
        }


        /**
         * Data found
         */
        $data['message'] = 'Data Found';
       
        $data['data'] = Todo::select('name','id')->where('id',$id)->first();

        return response($data, Response::HTTP_OK);
            
       

    }

   
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        /**
         * Data not found
         */
        $data = [];
        $check = Todo::where('id',$id)->get();

        if(!count($check)){
            $data['message'] = 'Not Found';
            
            $data['data'] = [];

            return response($data, Response::HTTP_NOT_FOUND);
            
        }

        

        /**
         * Data Validation
         */


        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:todos|max:20',
            
        ]);

        $errors = $validator->errors();
        
        if($errors->first('name')){
            $data['name'] = $errors->first('name');
        }

        if(isset($data['name'])){
            
            $data['message'] = 'Unprocessable Entity';
            $data['data'] = [];
            return response($data, Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        

         /**
         * Data Update
         */
        
        Todo::where('id',$id)->update($request->all());
        
        $data['message'] = 'data updated succesfully';
        $data['data'] = Todo::select('name','id')->where('id',$id)->first();

        return response($data, Response::HTTP_OK);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         /**
         * Data not found
         */
        $data = [];
        $check = Todo::where('id',$id)->get();

        if(!count($check)){
            $data['message'] = 'Not Found';
            $data['status'] = Response::HTTP_NOT_FOUND;
            $data['data'] = [];

            return response($data, Response::HTTP_NOT_FOUND);
            
        }

        

        /**
         * Data Delete
         */
        
        Todo::where('id',$id)->delete();
        $data['status'] = Response::HTTP_OK;
        $data['message'] = 'data deleted succesfully';
        return response($data, Response::HTTP_OK);
    }
}
