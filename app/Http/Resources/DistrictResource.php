<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\ThanaResource;

class DistrictResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'name' => $this->name,
            'href' => [
                'link' => route('district.show',$this->id)
            ],
            'thanas'=>ThanaResource::collection($this->thanas)
        ];

        return parent::toArray($request);
    }
}
