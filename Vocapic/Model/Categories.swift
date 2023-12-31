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
struct CategoryDetail: Codable {
    let category: String
    let categoryImage: String?
    let subcategoryDetails: [SubcategoryDetail]
}

// MARK: - SubcategoryDetail
struct SubcategoryDetail: Codable {
    let subcategory: String
    let subcategoryImage: String?
    let vocabulary: [Vocabulary]
}

// MARK: - Vocabulary
struct Vocabulary: Codable {
    let part, translation: String
    let language: String?
}

