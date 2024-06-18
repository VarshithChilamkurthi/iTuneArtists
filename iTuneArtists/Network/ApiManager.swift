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
    var decodedData: Model?
    // escaping is like an optional
    //using the closure to send data to ArtistsViewController
    func getApiData(url: String, closure: @escaping (Model?) -> ()) {
        guard let serverURL = URL(string: url) else {
            print(ServerErrors.invalidServerUrl.rawValue)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL) ) { data, response, error in
            if error != nil {
                print(ServerErrors.error.rawValue)
                return
            }
            if let unwrappedData = data {
                // calling decodeData() to decode the data from json
                guard let decodedData = self.decodeData(data: unwrappedData) else {
                    return
                }
                self.decodedData = decodedData
            }
            guard let unwrappedDecodedData = self.decodedData else { return }
            closure(unwrappedDecodedData)
        }.resume()
    }
    
    func getImageData(url: String, closure: @escaping (Data?) -> ()) {
        if let imageUrl = URL(string: url) {
            // used _, _ because urlsession return data, response and error and i'm not using response, error.
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, _, _ in
                if let imageData = data {
                    closure(imageData)
                }
            }.resume()
        }
    }
    
    func decodeData(data: Data) -> Model? {
        var decodedData: Model?
        do {
            decodedData = try JSONDecoder().decode(Model.self, from: data)
        } catch {
            print(ServerErrors.invalidServerData.rawValue)
        }
        return decodedData
    }
}
