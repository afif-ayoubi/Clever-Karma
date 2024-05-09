import { IsNotEmpty, IsString } from "class-validator";

export class CreatedVolunteeringOpportunityDto {
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