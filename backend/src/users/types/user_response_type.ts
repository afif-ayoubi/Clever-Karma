import { User } from "src/schemas/user.schema";

export type UserResponseType = Omit<User, 'password'> & { token: string };