import { Component, OnInit } from '@angular/core';
import { Sport } from '../shared/models/sport';
import { EncounterMode } from '../shared/models/encounterMode';
import { SelectItem } from 'primeng/components/common/selectitem';
import { ToasterService } from 'angular2-toaster';
import { SportService } from '../services';

@Component({
  selector: 'app-sports-management',
  templateUrl: './sports-management.component.html',
  styleUrls: ['./sports-management.component.css']
})
export class SportsManagementComponent implements OnInit {
  public sport: Sport;
  public encounterModes: SelectItem[];
  public selectedEncounterMode: EncounterMode;
  public sports: Sport[];
  public selectedSport: Sport;

  constructor(
    private sportService: SportService,
    private toasterService: ToasterService) {
    this.sport = new Sport();
    this.selectedSport=new Sport();
  }
  
  ngOnInit() {
    this.encounterModes = this.sportService.getEncounterModes();
    this.getSports();
  }

  public addSport(sport: Sport) {
    this.sportService.addSport(sport)
      .then(response => {
        this.toasterService.pop("success", "Success!", "Sport successfully added!");
      })
      .catch(error => {
        this.toasterService.pop("error", "Error!", "Could not add sport.");
      });
  }

  private async getSports() {
    this.sports = await this.sportService.getSports();
  }

}
