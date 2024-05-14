import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested, IsOptional, validate, IsNumber, isNotEmpty } from "class-validator";
import { Type } from "class-transformer";
import { VolunteeringSectionDto } from "src/users/volunteering_section/dto/volunteering_section.dto";

export class LocationDto {
    @IsOptional()
    @IsNumber()
    readonly longitude: number;


    @IsOptional()
    @IsNumber()
    readonly latitude: number;
}

export class OrganizationDetailDto {
    @IsString()
    @IsNotEmpty()
    readonly aboutUs: string;

    @IsString()
    @IsNotEmpty()
    readonly howToVolunteer: string;

    @IsString()
    @IsNotEmpty()
    readonly imageUrl: string;
    @IsNotEmpty()
    @ValidateNested({ each: true })
    @Type(() => LocationDto)
    readonly location: LocationDto

    @ValidateNested({ each: true })
    @Type(() => VolunteeringSectionDto)
    readonly VolunteeringSection: VolunteeringSectionDto;
}
export class CreateOrganizationDto {
    @IsNotEmpty()
    @IsString()
    readonly firstName: string;

    @IsNotEmpty()
    @IsString()
    readonly lastName: string;

    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @IsNotEmpty()
    readonly password: string;
    readonly liveStremingId: string;

    readonly role: string;

    readonly isActive: boolean;

    @ValidateNested({ each: true })
    @Type(() => OrganizationDetailDto)
    readonly organizationDetail: OrganizationDetailDto


}
