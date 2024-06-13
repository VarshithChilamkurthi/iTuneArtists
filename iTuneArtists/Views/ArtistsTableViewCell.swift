//
//  ArtistsTableViewCell.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import UIKit

class ArtistsTableViewCell: UITableViewCell {

    @IBOutlet var songImage: UIImageView!
    @IBOutlet var artistName: UILabel!
    @IBOutlet var primaryGenre: UILabel!
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(artists: Artists) {
        artistName.text = artists.artistName
        primaryGenre.text = artists.primaryGenreName
        price.text = String(artists.collectionPrice).priceFormatter()
        
        APIManager.sharedInstance.getData(url: artists.artworkUrl60) { data in
            guard let recievedImage = data else { return }
            DispatchQueue.main.async {
                self.songImage.image = UIImage(data: recievedImage)
            }
        }
    }
    
    func setUI() {
        price.layer.borderColor = UIColor.systemBlue.cgColor
        price.layer.borderWidth = 0.75
    }

}
