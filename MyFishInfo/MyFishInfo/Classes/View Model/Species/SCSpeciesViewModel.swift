//
//  SCSpeciesViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCSpeciesViewModel {
    var speciesAliases: String?
    var speciesName: String?
    var illustrationUrlString: String?
    var displayCellRowHeight: CGFloat?
    var isFarmed: Bool = false
    var imageUrlStrings: [String]?
    var basicInfoStrings: [String]?
    var aboutCellHeight: CGFloat?
    
    init(item: SCSpeciesDataItem) {
        speciesAliases = removeHtmlTags(htmlString: item.speciesAliases)
        speciesName = item.speciesName
        illustrationUrlString = item.speciesIllustrationPhoto?.src
        displayCellRowHeight = calculateDisplayCellHeight()
        if item.farmingMethods != nil && (item.farmingMethods?.count ?? 0) > 0{
            isFarmed = true
        }
        var urlStrings = [String]()
        for img in item.imageGallery ?? []{
            guard let urlString = img.src else{
                continue
            }
            urlStrings.append(urlString)
        }
        imageUrlStrings = urlStrings
        var basicInfoStrings = [String]()
        basicInfoStrings.append(item.population ?? "")
        basicInfoStrings.append(item.fishingRate ?? "")
        basicInfoStrings.append(item.habitatImpacts ?? "")
        basicInfoStrings.append(item.bycatch ?? "")
        self.basicInfoStrings = basicInfoStrings
        aboutCellHeight = calculateAboutCellHeight()
    }
}
extension SCSpeciesViewModel{
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
        height += speciesName?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.boldSystemFont(ofSize: 15)) ?? 0
        height += margin + (speciesAliases?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 13)) ?? 0)
        height += 3 * margin
        return height > 85 ? height : 85
    }
    
    func removeHtmlTags(htmlString: String?)->String{
        guard let str = htmlString else{
            return ""
        }
        return str.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: ", ", with: " • ", options: .regularExpression, range: nil)
    }
}
