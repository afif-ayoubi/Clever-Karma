import { Body, Controller, Post } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { CreatedVolunteeringOpportunityDto } from "./dto/created_volunteering_opportunity.dto";
import { VolunteeringOpportunity } from "src/schemas/volunteering_opportunity.schema";

@Controller('volunteering_opportunity')
export class VolunteeringOpportunityController {
    constructor(private volunteeringSectionService :VolunteeringSectionService ) {}

    @Post('')
    async createSection(@Body() createdVolunteeringOpportunityDto: CreatedVolunteeringOpportunityDto): Promise<VolunteeringOpportunity> {
        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringOpportunityDto);
    }
}