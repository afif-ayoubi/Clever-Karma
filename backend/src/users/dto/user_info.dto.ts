import { IsDate, IsNotEmpty, IsString } from "class-validator";

export class uderInfoDto {
    @IsNotEmpty()
    @IsString()
    readonly phone?: number;
    @IsNotEmpty()
    @IsString()
    readonly gender?: String;
    @IsNotEmpty()
    @IsDate()
    readonly dateOfBirth?: Date;
    @IsNotEmpty()
    @IsString()
    readonly image?: String;
}