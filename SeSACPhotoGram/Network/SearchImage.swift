//
//  SearchImage.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/30.
//

import Foundation
// MARK: - SearchImage
struct SearchImage: Codable {
    let total, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {

    let urls: Urls


    enum CodingKeys: String, CodingKey {

        case urls

    }
}


// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

