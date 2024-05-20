import { Body, Controller, HttpCode, Post } from '@nestjs/common';
import { IChatRequest, IChatResponse, OpenaiService } from './openai.service';

@Controller('openai')
export class OpenaiController {
  constructor(private openaiService: OpenaiService) {}

  @Post('/chat')
  @HttpCode(200)
  async getChatOpenai(@Body() request: IChatRequest = {}): Promise<IChatResponse> {
    const accidentData = request.accidentData || {};
    const predictedBloodType = this.openaiService.predictBloodType(accidentData);

    return {
      success: true,
      result: predictedBloodType,
    };
  }
}
