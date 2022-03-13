//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}
struct FeedResult: Decodable {
    let id,  name, artistName, artworkUrl100: String 
}
