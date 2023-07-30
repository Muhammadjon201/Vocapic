//
//  UnsplashPhotoModel.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import Foundation

struct UnsplashPhoto: Codable {
    let urls: PhotoURLs
}

struct PhotoURLs: Codable {
    let regular: String
}
