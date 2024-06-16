//
//  Constants.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import Foundation

var artists: [Artists] = []

enum Constants: String {
    case serverUrl = "https://itunes.apple.com/search?term=a"
}

enum ServerErrors: String {
    case invalidServerUrl = "Invalid server url"
    case error = "Encountered error while fetching data from server"
    case invalidServerData = "Invalid server data"
    case invalidDecode = "Unable to convert serialized object to food model"
}

enum TableViewCellIdentifiers: String {
    case ArtistsTableViewCell = "ArtistsTableViewCell"
}
