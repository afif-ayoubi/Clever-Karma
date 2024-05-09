import { Body, Controller, Delete, HttpException, HttpStatus, Param, Post, Request } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { CreatedVolunteeringSectionDto } from "./dto/created_volunteering_opportunity.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { ExpressRequest } from "../middlewares/auth.middleware";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService: VolunteeringSectionService) { }

    @Post('')
    async createSection(@Request() request: ExpressRequest, @Body() createdVolunteeringSectionDto: CreatedVolunteeringSectionDto): Promise<VolunteeringSection> {
        if (!request.user) throw new HttpException("UNAUTHORIZED", HttpStatus.UNAUTHORIZED);

        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringSectionDto);
    }
    @Delete(':id')
    async deleteSection(@Request() request: ExpressRequest, @Param('id') id: string): Promise<{ message: string }> {
        if (!request.user) throw new HttpException("UNAUTHORIZED", HttpStatus.UNAUTHORIZED);

        await this.volunteeringSectionService.deleteVolunteeringOpportunity(id);
        return { message: 'Volunteering opportunity deleted successfully' };
    }

}