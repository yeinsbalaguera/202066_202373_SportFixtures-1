import { Injectable } from "@angular/core";
import { BaseService } from "./base.service";
import { Http } from "@angular/http";
import { AppSettings } from "../config/appSettings";
import { Sport } from "../shared/models/sport";
import { EncounterMode } from "../shared/models/encounterMode";

@Injectable()
export class SportService extends BaseService {

    constructor(protected _http: Http) {
        super(_http);
    }

    public getEncounterModes() {
        var encounterModes = [
            { label: EncounterMode.Double, value: EncounterMode.Double },
            { label: EncounterMode.Multiple, value: EncounterMode.Multiple }
        ];
        return encounterModes;
    }

    public async addSport(sport: Sport) {
        return await this.post(AppSettings.ApiEndpoints.addSport, sport);
    }

    public async getSports(): Promise<any> {
        return await this.getAll(AppSettings.ApiEndpoints.getSports);
    }

    public async updateSport(sport: Sport) {
        return await this.update(AppSettings.ApiEndpoints.updateSport, sport);
    }

    public async deleteSport(id: string) {
        return await this.delete(AppSettings.ApiEndpoints.deleteSport, id);
    }

    public async getSportById(id: string): Promise<Sport> {
        return await this.getById(AppSettings.ApiEndpoints.getSportById, id);
    }
}