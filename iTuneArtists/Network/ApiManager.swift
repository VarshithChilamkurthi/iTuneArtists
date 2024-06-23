//
//  Api.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import Foundation

class APIManager {
    static let sharedInstance = APIManager()
    private init() {}
    // escaping is like an optional
    //using the closure to send data to ArtistsViewController
    func getApiData(url: String, closure: @escaping (Data?) -> ()) {
        guard let serverURL = URL(string: url) else {
            print(ServerErrors.invalidServerUrl.rawValue)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL) ) { data, response, error in
            if error != nil {
                print(ServerErrors.error.rawValue)
                return
            }
            closure(data)
        }.resume()
    }
}
