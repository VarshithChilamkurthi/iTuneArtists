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

    var artistsViewModelObj = ArtistsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.dataSource = self
        self.title = "Today's Hits"
    }
}
// MARK: - Table View
extension ArtistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsViewModelObj.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.ArtistsTableViewCell.rawValue) as! ArtistsTableViewCell
        cell.setData(artists: artistsViewModelObj.artists[indexPath.row])
        return cell
    }
}
// MARK: - Calling API & Reloading Table Data
extension ArtistsViewController {
    func fetchData() {
        artistsViewModelObj.fetchData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
