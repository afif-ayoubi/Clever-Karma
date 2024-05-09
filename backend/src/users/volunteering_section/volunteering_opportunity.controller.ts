import { Body, Controller, Delete, HttpException, HttpStatus, Param, Post, Request } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { CreatedVolunteeringSectionDto } from "./dto/created_volunteering_opportunity.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { ExpressRequest } from "../middlewares/auth.middleware";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService: VolunteeringSectionService) { }

    @Post('')
    async createSection( @Body() createdVolunteeringSectionDto: CreatedVolunteeringSectionDto): Promise<VolunteeringSection> {

        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringSectionDto);
    }
    @Delete(':id')
    async deleteSection( @Param('id') id: string): Promise<{ message: string }> {

        await this.volunteeringSectionService.deleteVolunteeringOpportunity(id);
        return { message: 'Volunteering opportunity deleted successfully' };
    }

}