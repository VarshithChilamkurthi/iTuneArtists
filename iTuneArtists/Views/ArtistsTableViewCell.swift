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
        APIManager.sharedInstance.getImageData(url: artists.artworkUrl60) { imageData in
            if let unwrappedImageData = imageData {
                DispatchQueue.main.async {
                    self.songImage.image = UIImage(data: unwrappedImageData)
                }
            }
        }
        // MARK: one way of converting image url to data
//        //converting image url to data and setting the image
//        guard let imageUrl = URL(string: artists.artworkUrl60) else { return }
//        // used _, _ because urlsession return data, response and error and i'm not using response, error.
//        URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, _, _ in
//            if let unwrappedData = data {
//                DispatchQueue.main.async {
//                    self.songImage.image = UIImage(data: unwrappedData)
//                }
//            }
//        }.resume()
        // MARK: Original method when we're returning data in the closure
//        APIManager.sharedInstance.getData(url: artists.artworkUrl60) { data in
//            guard let recievedImage = data else { return }
//            DispatchQueue.main.async {
//                self.songImage.image = UIImage(data: recievedImage)
//            }
//        }
    }
    
    func setUI() {
        price.layer.borderColor = UIColor.systemBlue.cgColor
        price.layer.borderWidth = 0.75
    }

}
