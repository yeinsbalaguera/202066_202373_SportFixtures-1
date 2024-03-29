import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { RouterModule, Routes } from "@angular/router";
import { FormsModule } from "@angular/forms";
import { AppSettings } from "src/app/config/appSettings";
import { ListboxModule } from "primeng/listbox";
import { DropdownModule } from "primeng/dropdown";
import { FixtureGeneratorComponent } from "./fixture-generator/fixture-generator.component";
import { FixtureService } from "src/app/services";
import { DatePickerModule } from "@syncfusion/ej2-angular-calendars";

const routes: Routes = [
    {
        path: '',
        component: FixtureGeneratorComponent
    },
    {
        path: AppSettings.RouterUrls.fixtureGenerator,
        component: FixtureGeneratorComponent
    }
];

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(routes),
        FormsModule,
        ListboxModule,
        DropdownModule,
        DatePickerModule
    ],
    declarations: [
        FixtureGeneratorComponent
    ],
    providers: [
        FixtureService
    ],
    exports: [
        FixtureGeneratorComponent
    ]

})
export class FixtureGeneratorModule { }