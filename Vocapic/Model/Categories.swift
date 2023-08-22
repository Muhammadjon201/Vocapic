//
//  Categories.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//



import UIKit
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let categoryDetails: [CategoryDetail]
}

// MARK: - CategoryDetail
struct CategoryDetail: String, Codable {
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
    //let image: Image?
}

//enum Image: String, Codable {
//    case empty = ""
//    case food = "food"
//    case pathToChestImageJpg = "path/to/chest_image.jpg"
//    case pathToNeckImageJpg = "path/to/neck_image.jpg"
//}
