import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class UserLocation {
    @Prop()
    latitude?: number;
    @Prop()
    longitude?: number;
}
export const UserLocationSchema = SchemaFactory.createForClass(UserLocation);