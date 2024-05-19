import { Injectable } from '@nestjs/common';
import 'dotenv/config';
import OpenAI from 'openai';

export interface IChatRequest {
  accidentData?: AccidentData;
}

export interface IChatResponse {
  success: boolean;
  result: string;
}

interface AccidentData {
  season?: string;
  accidents?: number;
  demographicFactor?: string;
  locationType?: string;
}

interface HistoricalData {
  season: string;
  accidentThreshold: number;
  bloodType: string;
  demographicFactor: string;
  locationType: string;
  country: string;
}

@Injectable()
export class OpenaiService {
  private historicalData: HistoricalData[] = [
    { season: 'summer', accidentThreshold: 100, bloodType: 'O+', demographicFactor: 'young', locationType: 'urban', country: 'Lebanon' },
    { season: 'summer', accidentThreshold: 50, bloodType: 'A-', demographicFactor: 'elderly', locationType: 'rural', country: 'Lebanon' },
    { season: 'summer', accidentThreshold: 120, bloodType: 'B+', demographicFactor: 'middle-aged', locationType: 'suburban', country: 'Lebanon' },
    { season: 'winter', accidentThreshold: 80, bloodType: 'B+', demographicFactor: 'young', locationType: 'urban', country: 'Lebanon' },
    { season: 'winter', accidentThreshold: 60, bloodType: 'AB-', demographicFactor: 'elderly', locationType: 'rural', country: 'Lebanon' },
    { season: 'spring', accidentThreshold: 90, bloodType: 'O-', demographicFactor: 'middle-aged', locationType: 'suburban', country: 'Lebanon' },
    { season: 'fall', accidentThreshold: 70, bloodType: 'A+', demographicFactor: 'young', locationType: 'urban', country: 'Lebanon' },
  ];
openAiService: OpenAI;
  constructor() {
    this.openAiService = new OpenAI({
      apiKey: process.env.OPENAI_API_KEY,
    });
  }

  private getCurrentSeason(): string {
    const month = new Date().getMonth() + 1;
    if (month >= 3 && month <= 5) return 'spring';
    if (month >= 6 && month <= 8) return 'summer';
    if (month >= 9 && month <= 11) return 'fall';
    return 'winter';
  }

  private aggregateData(season: string, country: string): string {
    const relevantData = this.historicalData.filter(
      data => data.season === season && data.country === country
    );

    const bloodTypeCounts = relevantData.reduce((acc, data) => {
      if (!acc[data.bloodType]) acc[data.bloodType] = 0;
      acc[data.bloodType]++;
      return acc;
    }, {});

    return Object.entries(bloodTypeCounts).reduce((max, curr) => curr[1] > max[1] ? curr : max)[0];
  }

  predictBloodType(accidentData: AccidentData): string {
    const season = accidentData.season || this.getCurrentSeason();
    const country = accidentData.locationType || 'Lebanon'; 

    return this.aggregateData(season, country);
  }
}
