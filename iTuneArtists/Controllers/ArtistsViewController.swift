//
//  ViewController.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import UIKit

class ArtistsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var artists: [Artists] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.dataSource = self
        self.title = "Today's Hits"
//        print(artists)
    }
}
// MARK: - Table View
extension ArtistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.ArtistsTableViewCell.rawValue) as! ArtistsTableViewCell
        cell.setData(artists: artists[indexPath.row])
        return cell
    }
}
// MARK: - Calling API & Fetching Data
extension ArtistsViewController {
    func fetchData() {
        let closure: ((Data?) -> ())  = { data in
            guard let serverData = data else {
                print(ServerErrors.invalidServerData.rawValue)
                return
            }
            do {
                let artistsArray = try JSONDecoder().decode(Model.self, from: serverData)
                print(artistsArray.results)
                self.artists = artistsArray.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            } catch {
                print(ServerErrors.invalidDecode.rawValue)
            }
        }
        APIManager.sharedInstance.getData(url: Constants.serverUrl.rawValue, closure: closure)
    }
}
