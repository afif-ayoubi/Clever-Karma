import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/create_user.dto";
import { UserResponseType } from "./types/user_response_type";
import { loginDto } from "./dto/login_dto";
import { compare } from "bcrypt";
import { sign } from 'jsonwebtoken';

@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>) { }
    async createUser(createUserDto: CreateUserDto): Promise<User> {
        const user = await this.userModel.findOne({ email: createUserDto.email });
        if (user) throw new HttpException("Email is already taken", HttpStatus.UNPROCESSABLE_ENTITY);
        const createdUser = new this.userModel(createUserDto);
        return createdUser.save();
    }
    async loginUser(loginDto: loginDto): Promise<User> {
        const user = await this.userModel.findOne({ email: loginDto.email }).select("+password");
        if (!user) throw new HttpException("User not found", HttpStatus.UNPROCESSABLE_ENTITY);
        const isPasswordCorrect=await compare(loginDto.password,user.password);
        if (!isPasswordCorrect) throw new HttpException("incorrect password", HttpStatus.UNPROCESSABLE_ENTITY);
        return user;
    }
    getUsers() {
        return this.userModel.find();
    }
    getUserById(id: String) {
        return this.userModel.findById(id);
    }
    buildUserResponse(user: User): UserResponseType {
        return {
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            role: user.role,
            token:this.generateJwt(user)
        };
    }
    generateJwt(user:User):string {
        return sign({email:user.email,role:user.role},'JWT_SECERET',);

}
}
