import { Body, Controller, HttpException, HttpStatus, Post,Request } from "@nestjs/common";
import { VolunteeringSectionService } from "./volunteering_opportunity.service";
import { CreatedVolunteeringSectionDto } from "./dto/created_volunteering_opportunity.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { ExpressRequest } from "../middlewares/auth.middleware";

@Controller('section')
export class VolunteeringSectionController {
    constructor(private volunteeringSectionService :VolunteeringSectionService ) {}

    @Post('')
    async createSection(@Request() request: ExpressRequest, @Body() createdVolunteeringSectionDto: CreatedVolunteeringSectionDto): Promise<VolunteeringSection> {
        if (!request.user) throw new HttpException("UNAUTHORIZED", HttpStatus.UNAUTHORIZED);

        return this.volunteeringSectionService.createdUserVolunteeringOpportunity(createdVolunteeringSectionDto);
    }
}