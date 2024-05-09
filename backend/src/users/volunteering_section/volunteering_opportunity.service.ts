import { Injectable, NotFoundException } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { CreatedVolunteeringSectionDto } from "./dto/created_volunteering_opportunity.dto";

@Injectable()
export class VolunteeringSectionService {
    constructor(@InjectModel(VolunteeringSection.name) private volunteeringSectionModel: Model<VolunteeringSection>
    ) { }

    async createdUserVolunteeringOpportunity(createdVolunteeringSectionDto: CreatedVolunteeringSectionDto): Promise<VolunteeringSection> {
        const createdVolunteeringSection = new this.volunteeringSectionModel(createdVolunteeringSectionDto);
        return createdVolunteeringSection.save();

    }
    async deleteVolunteeringOpportunity(id: string): Promise<void> {
        const deletedVolunteeringOpportunity = await this.volunteeringSectionModel.findOneAndDelete({ _id: id });
        if (!deletedVolunteeringOpportunity) {
            throw new NotFoundException(`Volunteering opportunity with ID ${id} not found`);
        }
    }
}