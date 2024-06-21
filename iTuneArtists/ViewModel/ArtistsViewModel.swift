//
//  ViewModel.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 17/06/24.
//

import Foundation

class ArtistsViewModel {
    
    var artists: [Artists] = []
    
    func fetchData(url: String, completion: @escaping () -> ()) {
        APIManager.sharedInstance.getApiData(url: url) { unwrappedDecodedData in
            guard let data = unwrappedDecodedData else {
                print(ServerErrors.invalidServerData.rawValue)
                return
            }
            self.artists = data.results
            //initializing the closure just to indicate that we finished fetching the data
            completion()
        }
    }
}
