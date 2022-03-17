//
//  Reviews.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 16/03/2022.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    var entry: [Entry] = []
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            entry = try container.decode([Entry].self, forKey: .entry)
        } catch {
            switch error {
            case DecodingError.typeMismatch(let expectedType, _) where expectedType == [Any].self || expectedType == [Entry].self:
                let singleEntry = try container.decode(Entry.self, forKey: .entry)
                entry = [singleEntry]
            case DecodingError.keyNotFound(_, _):
                entry = []
            default:
                print("error decoding data:", error)
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case entry
    }
}

struct Entry: Decodable {
    let author: Author
    let title, content, rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
