import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested, IsOptional, IsNumber } from "class-validator";
import { Type } from "class-transformer";

export class LiveStreamingDto {
    readonly liveStremingId: string;

    @IsIn([true, false])
    readonly isActivated: boolean;
}

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
    readonly location: LocationDto;

    @IsString()
    @IsNotEmpty()
    readonly volunteeringSectionId: string;
}

export class OrganizationDto {
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

    readonly role: string;
    readonly isActive: boolean;

    @Type(() => LiveStreamingDto)
    readonly liveStreaming: LiveStreamingDto;

    @ValidateNested({ each: true })
    @Type(() => OrganizationDetailDto)
    readonly organizationDetail: OrganizationDetailDto;
}
