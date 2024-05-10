import {  IsNumber, IsOptional } from "class-validator";

export class LocationDto{
    @IsOptional()
    @IsNumber()
    readonly longitude: number;

    
    @IsOptional()
    @IsNumber()
    readonly latitude: number;
}