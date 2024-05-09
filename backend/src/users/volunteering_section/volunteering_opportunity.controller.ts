import { Body, Controller, Delete, Get, HttpException, HttpStatus, Param, Patch, Post, Request } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { VolunteeringSectionDto } from "./dto/volunteering_opportunity.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService: VolunteeringSectionService) { }

    @Post('')
    async createSection(@Body() createdVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {

        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringSectionDto);
    }
    @Delete(':id')
    async deleteSection(@Param('id') id: string): Promise<{ message: string }> {

        await this.volunteeringSectionService.deleteVolunteeringOpportunity(id);
        return { message: 'Volunteering opportunity deleted successfully' };
    }

    @Patch(':id')
    async updateSection(@Param('id') id: string, @Body() updatedVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        return this.volunteeringSectionService.updateVolunteeringOpportunity(id, updatedVolunteeringSectionDto);
    }
    @Get('')
    async getAllSections(): Promise<VolunteeringSection[]> {
        return this.volunteeringSectionService.getAllVolunteeringOpportunities();
    }

}