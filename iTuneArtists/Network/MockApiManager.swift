//
//  MockApiManager.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 24/06/24.
//

import Foundation

class MockApiManager: APIManager {
    override func getApiData(url: String, closure: @escaping (Data?) -> ()) {
        closure(nil)
    }
}
