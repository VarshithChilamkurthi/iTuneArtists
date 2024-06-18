//
//  ViewModel.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 17/06/24.
//

import Foundation

class ArtistsViewModel {
    
    var artists: [Artists] = []
    
    func fetchData(completion: @escaping () -> ()) {
        APIManager.sharedInstance.getApiData(url: Constants.serverUrl.rawValue) { unwrappedDecodedData in
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
