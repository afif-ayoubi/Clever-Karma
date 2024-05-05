import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/create_user.dto";
import { UserResponseType } from "./types/user_response_type";

@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>) { }
    async createUser(createUserDto: CreateUserDto): Promise<User> {
        const user = await this.userModel.findOne({ email: createUserDto.email });
        if (user) throw new HttpException("Email is already taken", HttpStatus.UNPROCESSABLE_ENTITY);
        const createdUser = new this.userModel(createUserDto);
        return createdUser.save();
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
        };
    }

}