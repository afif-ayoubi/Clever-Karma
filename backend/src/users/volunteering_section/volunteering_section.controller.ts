import { Body, Controller, Delete, Get, HttpException, HttpStatus, Param, Patch, Post, Request } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_Section.service";
import { VolunteeringSectionDto } from "./dto/volunteering_Section.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService: VolunteeringSectionService) { }

    @Post('')
    async createSection(@Body() createdVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {

        return this.volunteeringSectionService.createdVolunteeringSection(createdVolunteeringSectionDto);
    }
    @Delete(':id')
    async deleteSection(@Param('id') id: string): Promise<{ message: string }> {

        await this.volunteeringSectionService.deleteVolunteeringSection(id);
        return { message: 'Volunteering Section deleted successfully' };
    }

    @Patch(':id')
    async updateSection(@Param('id') id: string, @Body() updatedVolunteeringSectionDto: VolunteeringSectionDto): Promise<VolunteeringSection> {
        return this.volunteeringSectionService.updateVolunteeringSection(id, updatedVolunteeringSectionDto);
    }
    @Get('')
    async getAllSections(): Promise<VolunteeringSection[]> {
        return this.volunteeringSectionService.getAllVolunteeringOpportunities();
    }

}