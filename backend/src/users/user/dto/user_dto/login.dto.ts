import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested } from "class-validator";
import { LocationDto } from "../organization_dto/location.dto";
import { Type } from "class-transformer";

export class LoginDto {


    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @IsNotEmpty()
    readonly password: string;

    @ValidateNested({ each: true })
    @Type(() => LocationDto)
    location: LocationDto
}
