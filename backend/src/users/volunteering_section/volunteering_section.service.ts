import { HttpException, HttpStatus, Injectable, NotFoundException } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { VolunteeringSection } from "src/schemas/volunteering_Section.schema";
import { VolunteeringSectionDto } from "./dto/volunteering_section.dto";

@Injectable()
export class VolunteeringSectionService {
    constructor(@InjectModel(VolunteeringSection.name) private volunteeringSectionModel: Model<VolunteeringSection>
    ) { }

    async createdVolunteeringSection(createdVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        const createdVolunteeringSection = new this.volunteeringSectionModel(createdVolunteeringSectionDto);
        return createdVolunteeringSection.save();

    }
    async deleteVolunteeringSection(id: string): Promise<void> {
        const deletedVolunteeringSection = await this.volunteeringSectionModel.findOneAndDelete({ _id: id });
        if (!deletedVolunteeringSection) {
            throw new NotFoundException(`Volunteering Section with ID ${id} not found`);
        }
    }
    async updateVolunteeringSection(id: string, updatedVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        const updatedVolunteeringSection = await this.volunteeringSectionModel.findByIdAndUpdate(id, updatedVolunteeringSectionDto, { new: true });
        if (!updatedVolunteeringSection) throw new HttpException("Section not found", HttpStatus.UNPROCESSABLE_ENTITY);

        return updatedVolunteeringSection;
    }
    async getAllVolunteeringOpportunities(): Promise<VolunteeringSection[]> {
        return this.volunteeringSectionModel.find();
    }
}