import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";

export class LiveStreaming {
    @Prop({ default: Math.floor(1000000 + Math.random() * 9000000).toString()})
    liveStremingId: string;
    @Prop({ default: false})
    isActivated: boolean;
}
export const LiveStreamingSchema = SchemaFactory.createForClass(LiveStreaming);