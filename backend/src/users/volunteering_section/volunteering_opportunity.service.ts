import { HttpException, HttpStatus, Injectable, NotFoundException } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { VolunteeringSectionDto } from "./dto/volunteering_opportunity.dto";

@Injectable()
export class VolunteeringSectionService {
    constructor(@InjectModel(VolunteeringSection.name) private volunteeringSectionModel: Model<VolunteeringSection>
    ) { }

    async createdUserVolunteeringOpportunity(createdVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        const createdVolunteeringSection = new this.volunteeringSectionModel(createdVolunteeringSectionDto);
        return createdVolunteeringSection.save();

    }
    async deleteVolunteeringOpportunity(id: string): Promise<void> {
        const deletedVolunteeringOpportunity = await this.volunteeringSectionModel.findOneAndDelete({ _id: id });
        if (!deletedVolunteeringOpportunity) {
            throw new NotFoundException(`Volunteering opportunity with ID ${id} not found`);
        }
    }
    async updateVolunteeringOpportunity(id: string, updatedVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        const updatedVolunteeringOpportunity = await this.volunteeringSectionModel.findByIdAndUpdate(id, updatedVolunteeringSectionDto, { new: true });
        if (!updatedVolunteeringOpportunity) throw new HttpException("Section not found", HttpStatus.UNPROCESSABLE_ENTITY);

        return updatedVolunteeringOpportunity;
    }
    async getAllVolunteeringOpportunities(): Promise<VolunteeringSection[]> {
        return this.volunteeringSectionModel.find();
    }
}