import { IsNotEmpty, IsString, IsEmail, IsIn, ValidateNested, IsOptional, validate } from "class-validator";




export class CreateUserDto {


    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @IsNotEmpty()
    readonly password: string;

    readonly role: string;

  
}
