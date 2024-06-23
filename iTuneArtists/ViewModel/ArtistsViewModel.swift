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
        APIManager.sharedInstance.getApiData(url: url) { data in
            guard let data = data else {
                print(ServerErrors.invalidServerData.rawValue)
                return
            }
            //decoding data
            self.decodeData(data: data)
            //initializing the closure just to indicate that we finished fetching the data
            completion()
        }
    }
    
    func decodeData(data: Data) -> () {
//        var decodedData: Model?
        do {
            let decodedData = try JSONDecoder().decode(ArtistsModel.self, from: data)
            artists = decodedData.results
        } catch {
            print(ServerErrors.invalidServerData.rawValue)
        }
    }
}
