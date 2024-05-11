import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested, IsOptional, validate } from "class-validator";
import { USER_ROLES } from "src/users/user/utils/user_roles_enum";
import { LocationDto } from "./location.dto";
import { Type } from "class-transformer";



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
    @Type(() => LocationDto)
    location: LocationDto
}
