import { Type } from "class-transformer";
import { IsNotEmpty, IsString, Validate, ValidateNested } from "class-validator";
import { VolunteeringSectionDto } from "src/users/volunteering_section/dto/volunteering_section.dto";

export class OrganizationDto {
    @IsString()
    @IsNotEmpty()
    readonly aboutUs: string;

    @IsString()
    @IsNotEmpty()
    readonly howToVolunteer: string;

    @IsString()
    @IsNotEmpty()
    readonly imageUrl: string;

    @ValidateNested({ each: true })
    @Type(() =>VolunteeringSectionDto) 
    readonly volunteeringSection: VolunteeringSectionDto;   
}