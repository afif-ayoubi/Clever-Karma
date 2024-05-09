import { Type } from "class-transformer";
import { IsNotEmpty, IsString, Validate, ValidateNested } from "class-validator";
import { VolunteeringSectionDto } from "src/users/volunteering_section/dto/volunteering_opportunity.dto";

export class OrganizationDto {
    @IsString()
    @IsNotEmpty()
    aboutUs: string;

    @IsString()
    @IsNotEmpty()
    howToVolunteer: string;

    @IsString()
    @IsNotEmpty()
    imageUrl: string;

    @ValidateNested({ each: true })
    @Type(() =>VolunteeringSectionDto) 
    volunteeringSection: VolunteeringSectionDto;   
}