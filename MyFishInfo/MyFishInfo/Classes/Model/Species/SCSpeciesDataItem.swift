//
//  SCSpeciesDataItem.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 25/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCSpeciesDataItem: Codable {
    let fisheryManagement: String?
    let habitat: String?
    let habitatImpacts: String?
    let imageGallery: [SCSpeciesDataItemImageGallery]?
    let location: String?
    let management: String?
    let noaaFisheriesRegion: String?
    let population: String?
    let populationStatus: String?
    let scientificName: String?
    let speciesAliases: String?
    let speciesIllustrationPhoto: SCSpeciesDataItemImageGallery?
    let speciesName: String?
    let animalHealth: String?
    let availability: String?
    let biology: String?
    
    let bycatch: String?
    let calories: String?
    let carbohydrate: String?
    let cholesterol: String?
    let color: String?
    let diseaseTreatmentAndPrevention: String?
    let diseasesInSalmon: String?
    let displayedSeafoodProfileIllustration: String?
    let ecosystemServices: String?
    let environmentalConsiderations: String?
    let environmentalEffects: String?
    let farmingMethods: String?
    let fatTotal: String?
    let feeds: String?
    let fiberTotalDietary: String?
    let fishingRate: String?
    let harvest: String?
    let harvestType: String?
    let healthBenefits: String?
    let humanHealth: String?
    let physicalDescription: String?
    let production: String?
    let protein: String?
    let quote: String?
    
    let quoteBackgroundColor: String?
    let research: String?
    let saturatedFattyAcidsTotal: String?
    let selenium: String?
    let servingWeight: String?
    let servings: String?
    let sodium: String?
    let source: String?
    let sugarsTotal: String?
    let taste: String?
    let texture: String?
    let path: String?
    
    private enum CodingKeys: String, CodingKey {
        case fisheryManagement = "Fishery Management"
        case habitat = "Habitat"
        case habitatImpacts = "Habitat Impacts"
        case imageGallery = "Image Gallery"
        case location = "Location"
        case management = "Management"
        case noaaFisheriesRegion = "NOAA Fisheries Region"
        case population = "Population"
        case populationStatus = "Population Status"
        case scientificName = "Scientific Name"
        case speciesAliases = "Species Aliases"
        case speciesIllustrationPhoto = "Species Illustration Photo"
        case speciesName = "Species Name"
        case animalHealth = "Animal Health"
        case availability = "Availability"
        case biology = "Biology"
        case bycatch = "Bycatch"
        case calories = "Calories"
        case carbohydrate = "Carbohydrate"
        case cholesterol = "Cholesterol"
        case color = "Color"
        case diseaseTreatmentAndPrevention = "Disease Treatment and Prevention"
        case diseasesInSalmon = "Diseases in Salmon"
        case displayedSeafoodProfileIllustration = "Displayed Seafood Profile Illustration"
        case ecosystemServices = "Ecosystem Services"
        case environmentalConsiderations = "Environmental Considerations"
        case environmentalEffects = "Environmental Effects"
        case farmingMethods = "Farming Methods"
        case fatTotal = "Fat, Total"
        case feeds = "Feeds"
        
        case fiberTotalDietary = "Fiber, Total Dietary"
        case fishingRate = "Fishing Rate"
        case harvest = "Harvest"
        case harvestType = "Harvest Type"
        case healthBenefits = "Health Benefits"
        case humanHealth = "Human Health"
        case physicalDescription = "Physical Description"
        case production = "Production"
        case protein = "Protein"
        case quote = "Quote"
        
        case quoteBackgroundColor = "Quote Background Color"
        case research = "Research"
        case saturatedFattyAcidsTotal = "Saturated Fatty Acids, Total"
        case selenium = "Selenium"
        case servingWeight = "Serving Weight"
        case servings = "Servings"
        case sodium = "Sodium"
        case source = "Source"
        case sugarsTotal = "Sugars, Total"
        case taste = "Taste"
        
        case texture = "Texture"
        case path = "Path"
    }
}
struct SCSpeciesDataItemImageGallery: Codable {
    let src: String?
    let alt: String?
    let title: String?
}
