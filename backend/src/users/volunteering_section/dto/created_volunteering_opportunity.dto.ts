import { IsNotEmpty, IsString } from "class-validator";

export class CreatedVolunteeringSectionDto {
    @IsString()
    @IsNotEmpty()
    name: string;
    
    @IsString()
    @IsNotEmpty()
    description: string;

    @IsString()
    @IsNotEmpty()
    imageUrl: string;
}