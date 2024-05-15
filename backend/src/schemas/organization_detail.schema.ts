import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { VolunteeringSection, VolunteeringSectionSchema } from './volunteering_opportunity.schema';
import { OrganizationLocation, OrganizationLocationSchema } from './location.schema';
import { LiveStreaming, LiveStreamingSchema } from './live_streaming.schema';

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
    @Prop({ required: true, type: VolunteeringSectionSchema })
    VolunteeringSection: VolunteeringSection;
    @Prop({ type: LiveStreamingSchema})
    liveStreamingL:LiveStreaming

}
export const OrganizationDetailSchema = SchemaFactory.createForClass(OrganizationDetail);