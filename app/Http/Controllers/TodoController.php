<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\TodoResource;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct()
     {
        $this->middleware('auth:api')->except('index','show');
     }
    public function index(Request $request)
    {
        
        
        $limit = $request->limit;
        $skip = $request->page;

        if(!$request->limit || !$request->page){
            $data['total'] = Todo::select('id','name')->count();
            $data['data'] = Todo::select('id','name')->get();
        }else{
            $data['total'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get()->count();
            $data['data'] = Todo::select('id','name')->skip($skip*$limit)->take($limit)->get();
        }

        

        return $data;

        // $limit = $request->limit;
        // $skip = $request->page;

        // if(!$request->limit || !$request->page){
        //     return TodoResource::collection(Todo::all());
        // }
        // return TodoResource::collection(Todo::skip($skip*$limit)->take($limit)->get());
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
        Todo::create($request->all());
        return '{"message":"data created succesfully"}';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['data'] = Todo::where('id',$id)->first();

        if($data['data']){
            return $data;
        }else {
            $data['message'] = 'Invalid Id'; 
            return $data;
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function edit(Todo $todo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Todo $todo)
    {
        
        Todo::where('id',$todo->id)->update($request->all());

        return '{"message":"data updated succesfully"}';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Todo $todo)
    {
        Todo::where('id',$todo->id)->delete();

        return '{"message":"data deteted succesfully"}';
    }
}
