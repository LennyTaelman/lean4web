import { LeanWebConfig } from './docs' // look here for documentation of the individual config options

const lean4webConfig : LeanWebConfig = {
  "projects": [
    { "folder": "LeanTutoraat",
      "name": "LeanTutoraat",
      "examples": [
        { "file" : "LeanTutoraat/00_Introduction.lean",
          "name": "00_Introduction" }
      ]
    }
  ],
  "serverCountry": "Netherlands",
  "contactDetails": null,
  "impressum": null
}

export default lean4webConfig
