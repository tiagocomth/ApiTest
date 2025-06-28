//
//  Photo.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation

struct PhotoResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Photo]
}


struct Photo: Codable, Identifiable {
    let id: String
    let urls: Urls

}

struct Urls: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
