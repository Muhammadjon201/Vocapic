//
//  Categories.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//

import UIKit

//struct Categories {
//    var backgroundImage: UIImage?
//    var typeLabel: String?
//}
//
//struct DetailInfo {
//    var detailImage: UIImage?
//    var detailLabel: String?
//}
//


// MARK: - Welcome
struct Welcome: Codable {
    let categoryDetails: [CategoryDetail]
}

// MARK: - CategoryDetail
struct CategoryDetail: Codable {
    let category: String
    let subcategoryDetails: [SubcategoryDetail]
}

// MARK: - SubcategoryDetail
struct SubcategoryDetail: Codable {
    let subcategory: String
    let vocabulary: [Vocabulary]
}

// MARK: - Vocabulary
struct Vocabulary: Codable {
    let part, translation: String
    let image: String?
}

enum Image: String, Codable {
    case pathToChestImageJpg = "food"
    case pathToNeckImageJpg = "home"
}


