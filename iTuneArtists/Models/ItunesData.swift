//
//  ItunesData.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import Foundation

struct ArtistsModel: Codable {
    let resultCount: Int
    let results: [Artists]
}

struct Artists: Codable {
    let artistName: String
    let country: String
    let primaryGenreName: String
    let collectionPrice: Double
    let artworkUrl60: String
}
