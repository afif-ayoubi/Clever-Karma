import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { VolunteeringOpportunity } from "src/schemas/volunteering_opportunity.schema";
import { CreatedVolunteeringOpportunityDto } from "./dto/created_volunteering_opportunity.dto";

@Injectable()
export class VolunteeringSectionService {
    constructor(@InjectModel(VolunteeringOpportunity.name) private volunteeringOpportunityModel: Model<VolunteeringOpportunity>
    ) { }

    async createdUserVolunteeringOpportunity(createdVolunteeringOpportunityDto: CreatedVolunteeringOpportunityDto): Promise<VolunteeringOpportunity> {
        const createdVolunteeringOpportunity = new this.volunteeringOpportunityModel(createdVolunteeringOpportunityDto);
        return createdVolunteeringOpportunity.save();

    }
}