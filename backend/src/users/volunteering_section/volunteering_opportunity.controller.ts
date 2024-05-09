import { Body, Controller, Post } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { CreatedVolunteeringSectionDto } from "./dto/created_volunteering_opportunity.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService :VolunteeringSectionService ) {}

    @Post('')
    async createSection(@Body() createdVolunteeringSectionDto: CreatedVolunteeringSectionDto): Promise<VolunteeringSection> {
        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringSectionDto);
    }
}