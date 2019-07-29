//
//  SCSpeciesViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import HTMLString

struct SCSpeciesViewModel {
    var item: SCSpeciesDataItem?
    var speciesAliases: String?
    var speciesName: String?
    var illustrationUrlString: String?
    var displayCellRowHeight: CGFloat?
    var isFarmed: Bool = false
    var imageGalleryItems: [SCSpeciesImageGalleryItem]?
    var basicInfoStrings: [String]?
    var aboutCellHeight: CGFloat?
    let wildSpecies = [["image":"population", "title":"POPULATION"],
                       ["image":"fishingRate", "title":"FISHING RATE"],
                       ["image":"habitatImpacts", "title":"HABITAT IMPACTS"],
                       ["image":"bycatch", "title":"BYCATCH"]]
    let farmSpecies = [["image":"environmentalImpact", "title":"ENVIORNMENTAL IMPACT"],
                       ["image":"feeds", "title":"FEEDS"],
                       ["image":"farmingMethods", "title":"FARMING METHODS"],
                       ["image":"humanHealth", "title":"HUMAN HEALTH"]]
    
    var nutritionFactsItems: [SCNutritionFactsItem]?
    var tasteStrings: [String]?
    var healthHeaderViewHeight: CGFloat?
    var showHealthHeaderView: Bool = false
    
    var scienceItems: [SCScienceItem]?
    var fisheryItems: [SCScienceItem]?
    
    init(item: SCSpeciesDataItem) {
        self.item = item
        speciesAliases = removeHtmlTags(htmlString: item.speciesAliases).replacingOccurrences(of: ", ", with: " • ", options: .regularExpression, range: nil)
        speciesName = item.speciesName
        illustrationUrlString = item.speciesIllustrationPhoto?.src
        displayCellRowHeight = calculateDisplayCellHeight()
        if item.farmingMethods != nil && (item.farmingMethods?.count ?? 0) > 0{
            isFarmed = true
        }
        imageGalleryItems = prepareImageGalleryItems(item: item)
        basicInfoStrings = prepareBasicInfo(item: item)
        aboutCellHeight = calculateAboutCellHeight()
        nutritionFactsItems = prepareNutritionFactsItem(item: item)
        tasteStrings = prepareTasteStrings(item: item)
        healthHeaderViewHeight = calculateHealthHeaderViewHeight()
        scienceItems = prepareScienceItems(item: item)
        fisheryItems = prepareFisheryItems(item: item)
    }
}
extension SCSpeciesViewModel{
    // image gallery
    func prepareImageGalleryItems(item: SCSpeciesDataItem)->[SCSpeciesImageGalleryItem]{
        var imageGalleryItems = [SCSpeciesImageGalleryItem]()
        for imageGallery in item.imageGallery ?? []{
            imageGalleryItems.append(SCSpeciesImageGalleryItem(
                src: imageGallery.src,
                alt: getHtmlTagsWithoutMultiNewlines(htmlString: imageGallery.alt),
                title: getHtmlTagsWithoutMultiNewlines(htmlString: imageGallery.title)))
        }
        return imageGalleryItems
    }
 
    // basic information
    func prepareBasicInfo(item: SCSpeciesDataItem)->[String]{
        var basicInfoStrings = [String]()
        if isFarmed{
            basicInfoStrings.append(item.environmentalEffects ?? "")
            basicInfoStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.feeds))
            basicInfoStrings.append(item.farmingMethods ?? "")
            basicInfoStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.humanHealth))
        }else{
            basicInfoStrings.append(item.population ?? "")
            basicInfoStrings.append(item.fishingRate ?? "")
            basicInfoStrings.append(item.habitatImpacts ?? "")
            basicInfoStrings.append(item.bycatch ?? "")
        }
        basicInfoStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.availability))
        basicInfoStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.source))
        basicInfoStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.color))
        return basicInfoStrings
    }
    // nutrition facts item
    func prepareNutritionFactsItem(item: SCSpeciesDataItem)->[SCNutritionFactsItem]{
        var nutritionFactsItems = [SCNutritionFactsItem]()
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SERVINGS", description: item.servings))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SERVING WEIGHT", description: item.servingWeight))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "CALORIES", description: item.calories))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "PROTEIN", description: item.protein))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "FAT, TOTAL", description: item.fatTotal))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SATURATED FATTY ACIDS, TOTAL", description: item.saturatedFattyAcidsTotal))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "CARBOHYDRATE", description: item.carbohydrate))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SUGARS, TOTAL", description: item.sugarsTotal))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "FIBER, TOTAL DIETARY", description: item.fiberTotalDietary))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "CHOLESTEROL", description: item.cholesterol))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SELENIUM", description: item.selenium))
        nutritionFactsItems.append(SCNutritionFactsItem(keyName: "SODIUM", description: item.sodium))
        return nutritionFactsItems
    }
    // health header view
    mutating func prepareTasteStrings(item: SCSpeciesDataItem)->[String]{
        var tasteStrings = [String]()
        tasteStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.taste))
        tasteStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.texture))
        tasteStrings.append(getHtmlTagsWithoutMultiNewlines(htmlString: item.healthBenefits))
        for str in tasteStrings{
            if str.count > 0{
                showHealthHeaderView = true
            }
        }
        return tasteStrings
    }
     // science items
    func prepareScienceItems(item: SCSpeciesDataItem)->[SCScienceItem]{
        var scienceItems = [SCScienceItem]()
        if isFarmed{
            scienceItems.append(SCScienceItem(keyName: "ENVIRONMENTAL CONSIDERATIONS", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.environmentalConsiderations)))
            
            scienceItems.append(SCScienceItem(keyName: "ANIMAL HEALTH", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.animalHealth)))
            
            scienceItems.append(SCScienceItem(keyName: "HUMAN HEALTH", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.humanHealth)))
        }else{
            scienceItems.append(SCScienceItem(keyName: "POPULATION STATUS", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.populationStatus)))
            
            scienceItems.append(SCScienceItem(keyName: "LOCATION", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.location)))
            
            scienceItems.append(SCScienceItem(keyName: "HABITAT", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.habitat)))
        }
        
        scienceItems.append(SCScienceItem(keyName: "PHYSICAL DESCRIPTION", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.physicalDescription)))
        
        scienceItems.append(SCScienceItem(keyName: "BIOLOGY", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.biology)))
        
        scienceItems.append(SCScienceItem(keyName: "RESEARCH", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.research)))
        return scienceItems
    }
    func prepareFisheryItems(item: SCSpeciesDataItem)->[SCScienceItem]{
        var fisheryItems = [SCScienceItem]()
        if isFarmed{
            fisheryItems.append(SCScienceItem(keyName: "MANAGEMENT", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.management)))
            
            fisheryItems.append(SCScienceItem(keyName: "FARMING METHODS", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.farmingMethods)))
            
            fisheryItems.append(SCScienceItem(keyName: "PRODUCTION", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.production)))
        }else{
            fisheryItems.append(SCScienceItem(keyName: "FISHERY MANAGEMENT", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.fisheryManagement)))
            
            fisheryItems.append(SCScienceItem(keyName: "HARVEST", description: getHtmlTagsWithoutMultiNewlines(htmlString: item.harvest)))
        }
        return fisheryItems
    }
}
extension SCSpeciesViewModel{
    func calculateHealthHeaderViewHeight()->CGFloat{
        let margin: CGFloat = 3
        let labelMargin: CGFloat = 10
        let labelHeight: CGFloat = 18
        let separatorViewHeight: CGFloat = 1
        let viewWidth = UIScreen.screenWidth() - margin * 2
        var height = margin
        for str in self.tasteStrings ?? []{
            height += labelHeight + margin
            let descriptionHeight = str.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 15))
            height += descriptionHeight
            height += labelMargin
            if str.count == 0{
                height -= descriptionHeight
            }
        }
        height -= labelMargin
        height += margin + separatorViewHeight
        return height
    }
    
    func calculateAboutCellHeight()->CGFloat{
        let margin: CGFloat = 3
        let labelMargin: CGFloat = 10
        let iconImageHeight : CGFloat = 18
        let viewWidth = UIScreen.screenWidth() - margin * 2
        var height = margin
        for string in basicInfoStrings ?? []{
            height += iconImageHeight
            height += margin + string.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 15))
            height += labelMargin
        }
        height -= labelMargin
        height += margin * 4
        return height
    }
    
    
    func calculateDisplayCellHeight()->CGFloat{
        let margin: CGFloat = 3
        let tableIndexWidth: CGFloat = 20
        let imageViewWidth: CGFloat = 160
        let viewWidth = UIScreen.screenWidth() - imageViewWidth - margin * 5 - tableIndexWidth
        var height = margin
        height += speciesName?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.boldSystemFont(ofSize: 14)) ?? 0
        height += margin + (speciesAliases?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 13)) ?? 0)
        height += 3 * margin
        return height > 85 ? height : 85
    }
}
extension SCSpeciesViewModel{
    func removeHtmlTags(htmlString: String?)->String{
        guard let str = htmlString else{
            return ""
        }
        return str.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    func getHtmlTagsWithoutMultiNewlines(htmlString: String?)->String{
        return (removeHtmlTags(htmlString: htmlString) as NSString)
            .removeMultiNewlines()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .removingHTMLEntities
    }
}
