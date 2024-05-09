import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class UserLocation {
    @Prop()
    latitude?: string;
    @Prop()
    longitude?: string;
}
export const UserLocationSchema = SchemaFactory.createForClass(UserLocation);