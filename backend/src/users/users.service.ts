import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model, Types } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/create_user.dto";
import { UserAuthResponseType } from "./types/auth_user_response_type";
import { loginDto } from "./dto/login_dto";
import { compare } from "bcrypt";
import { sign } from 'jsonwebtoken';
import { HydratedDocument } from 'mongoose';
import { UserResponseType } from "./types/user_response_type";

export type UserDocument = HydratedDocument<User>;


@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>) { }
    async createUser(createUserDto: CreateUserDto): Promise<UserDocument> {
        const user = await this.userModel.findOne({ email: createUserDto.email });
        if (user) throw new HttpException("Email is already taken", HttpStatus.UNPROCESSABLE_ENTITY);
        const createdUser = new this.userModel(createUserDto);
        return createdUser.save();
    }
    async loginUser(loginDto: loginDto): Promise<UserDocument> {
        const user = await this.userModel.findOne({ email: loginDto.email }).select("+password");
        if (!user) throw new HttpException("User not found", HttpStatus.UNPROCESSABLE_ENTITY);
        const isPasswordCorrect = await compare(loginDto.password, user.password);
        if (!isPasswordCorrect) throw new HttpException("incorrect password", HttpStatus.UNPROCESSABLE_ENTITY);
        return user;    
    }
    getUsers(): Promise<User[]> {
        return this.userModel.find();
    }

    async updateUser(id: string, updateUserDto: any): Promise<UserDocument> {
        const existingUser = await this.userModel.findOne({ email: updateUserDto.email });
        if (existingUser && existingUser._id.toString() !== id) {
          throw new HttpException("Email already exists", HttpStatus.CONFLICT);
        }
        const user = this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true });
        if (!user) throw new HttpException("User not found", HttpStatus.UNPROCESSABLE_ENTITY);
        return user;
    }
    buildUserResponse(user: UserDocument): UserResponseType {
        return {
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            role: user.role,
            id: user._id
        };
    }
    buildAuthUserResponse(user: UserDocument): UserAuthResponseType {
        return {
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            role: user.role,
            token: this.generateJwt(user),
            id: user._id

        };
    }

    generateJwt(user: UserDocument): string {
        const userId = user._id;
        return sign({ userId: userId }, 'JWT_SECRET');
    }
    async findById(id: Types.ObjectId): Promise<UserDocument> {
        return this.userModel.findById(id);
    }
}
