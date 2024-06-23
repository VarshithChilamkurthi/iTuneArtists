//
//  MockApiManager.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import Foundation

class MockArtistsViewModel: ArtistsViewModel {
    override func fetchData(url: String, completion: @escaping () -> ()) {
        self.artists = [Artists(artistName: "Varshith", country: "USA", primaryGenreName: "Pop", collectionPrice: 0.0, artworkUrl60: "none"),
                        Artists(artistName: "abc", country: "abc", primaryGenreName: "abc", collectionPrice: 0.0, artworkUrl60: "none")]
        completion()
    }
}
