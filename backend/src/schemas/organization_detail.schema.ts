import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { VolunteeringSection } from './volunteering_opportunity.schema';
import { OrganizationLocation, OrganizationLocationSchema } from './location.schema';

@Schema()
export class OrganizationDetail {
  
    @Prop({ required: true })
    aboutUs: string;
    @Prop({ required: true })
    howToVolunteer: string;
    @Prop({ required: true })
    imageUrl: string;
    @Prop({  default: false})
    isActive: boolean;
    @Prop({ type: OrganizationLocationSchema, })
    location?: OrganizationLocation;
    @Prop({ required: true, type: VolunteeringSection })
    VolunteeringSection: VolunteeringSection;

}
export const OrganizationDetailSchema = SchemaFactory.createForClass(OrganizationDetail);