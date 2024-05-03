import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/create_user.dto";

@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>) { }
    createUser(createUserDto: CreateUserDto) {
        const user=new this.userModel(createUserDto);
        return user.save();
    }
    getUsers(){
        return this.userModel.find();
    }
    getUserById(id:String){
        return this.userModel.findById(id);
    }
    
}