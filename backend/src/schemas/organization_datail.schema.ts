import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { VolunteeringOpportunity } from './volunteering_opportunity.schema';

@Schema()
export class OrganizationDetail {
    @Prop({ required: true })
    aboutUs: string;
    @Prop({ required: true })
    howToVolunteer: string;
    @Prop({ required: true })
    imageUrl: string;
    @Prop({ required: true, type: VolunteeringOpportunity })
    VolunteeringOpportunity: VolunteeringOpportunity;

}
export const OrganizationDetailSchema = SchemaFactory.createForClass(OrganizationDetail);