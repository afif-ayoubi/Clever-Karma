import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { VolunteeringSection } from './volunteering_opportunity.schema';

@Schema()
export class OrganizationDetail {
    @Prop({ required: true })
    aboutUs: string;
    @Prop({ required: true })
    howToVolunteer: string;
    @Prop({ required: true })
    imageUrl: string;
    @Prop({ required: true, type: VolunteeringSection })
    VolunteeringSection: VolunteeringSection;

}
export const OrganizationDetailSchema = SchemaFactory.createForClass(OrganizationDetail);