import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class VolunteeringSection {
    remove() {
        throw new Error("Method not implemented.");
    }
    @Prop({ required: true })
    name: string;
    @Prop({ required: true })
    description: string;
    @Prop({ required: true })
    imageUrl: string;

}
export const VolunteeringSectionSchema = SchemaFactory.createForClass(VolunteeringSection); 