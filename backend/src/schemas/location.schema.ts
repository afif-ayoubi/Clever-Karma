import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class Location {
    @Prop()
    latitude?: string;
    @Prop()
    longitude?: string;
}
export const LocationSchema = SchemaFactory.createForClass(Location);