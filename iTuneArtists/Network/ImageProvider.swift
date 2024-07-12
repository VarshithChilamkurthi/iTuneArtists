//
//  ImageProvider.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/07/24.
//

import UIKit

class ImageProvider {
    static let shared = ImageProvider()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    public func fetchImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: url as NSString) {
            completion(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        print("Fetching image from URL: \(url)")
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self?.cache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            }
        }.resume()
    }
}
