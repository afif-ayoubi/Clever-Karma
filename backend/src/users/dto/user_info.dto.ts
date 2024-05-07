import { IsDate, IsNotEmpty, IsString } from "class-validator";

export class uderInfoDto {
    @IsNotEmpty()
    @IsString()
    phone?: number;
    @IsNotEmpty()
    @IsString()
    gender?: String;
    @IsNotEmpty()
    @IsDate()
    dateOfBirth?: Date;
    @IsNotEmpty()
    @IsString()
    image?: String;
}