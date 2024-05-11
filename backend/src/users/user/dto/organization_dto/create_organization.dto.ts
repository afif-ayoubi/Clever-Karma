import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested, IsOptional, validate } from "class-validator";
import { Type } from "class-transformer";
import { OrganizationLocation } from "src/schemas/location.schema";



export class CreateUserDto {
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

    @ValidateNested({ each: true })
    @Type(() => OrganizationLocation)
    location: OrganizationLocation
}
