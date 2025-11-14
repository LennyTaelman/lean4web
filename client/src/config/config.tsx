import { LeanWebConfig } from './docs' // look here for documentation of the individual config options

const lean4webConfig : LeanWebConfig = {
  "projects": [
    { "folder": "LeanTutoraat",
      "name": "LeanTutoraat",
      "examples": [
        { "file" : "LeanTutoraat/00_Introduction.lean",
          "name": "00_Introduction" },
        { "file" : "LeanTutoraat/01_Calculations.lean",
          "name": "01_Calculations" },
        { "file" : "LeanTutoraat/02_Structure.lean",
          "name": "02_Structure" },
        { "file" : "LeanTutoraat/03_Induction.lean",
          "name": "03_Induction" },
        { "file" : "LeanTutoraat/04_Recap.lean",
          "name": "04_Recap" }
      ]
    }
  ],
  "serverCountry": "Netherlands",
  "contactDetails": null,
  "impressum": null
}

export default lean4webConfig
