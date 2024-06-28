//
//  ViewController.swift
//  iTuneArtists
//
//  Created by Varshith Chilamkurthi on 12/06/24.
//

import UIKit
import MBProgressHUD

class ArtistsViewController: UIViewController {
    
    @IBOutlet var onlineSegmentedControl: UISegmentedControl!
    @IBOutlet var artistsSearchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var artistsViewModelObj = ArtistsViewModel()
    var mockArtistsViewModelObj = MockArtistsViewModel()
    var hud: MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.title = "Today's Hits"
        activityIndicator.stopAnimating()
//        self.hud.hide(animated: true)
    }
}
// MARK: - Table View Setup
extension ArtistsViewController: UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (onlineSegmentedControl.selectedSegmentIndex == 0) {
            return artistsViewModelObj.artists.count
        } else {
            return mockArtistsViewModelObj.artists.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.ArtistsTableViewCell.rawValue) as! ArtistsTableViewCell
        if (onlineSegmentedControl.selectedSegmentIndex == 0) {
            cell.setData(artists: artistsViewModelObj.artists[indexPath.row])
        } else {
            cell.setData(artists: mockArtistsViewModelObj.artists[indexPath.row])
        }
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchedResult = searchBar.text {
            let url = Constants.serverUrl.rawValue + searchedResult
            if (onlineSegmentedControl.selectedSegmentIndex == 0) {
                fetchData(url: url)
            } else {
                fetchMockData(url: "mockurl")
            }
            searchBar.resignFirstResponder()
        }
    }
}
// MARK: - Calling API & Reloading Table Data
extension ArtistsViewController {
    func fetchData(url: String) {
        DispatchQueue.main.async {
//            self.activityIndicator.startAnimating()
            self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        artistsViewModelObj.fetchData(url: url) {
            DispatchQueue.main.async {
//                self.activityIndicator.startAnimating()
//                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.animationType = .fade
                self.tableView.reloadData()
//                self.activityIndicator.stopAnimating()
                self.hud.hide(animated: true)
            }
        }
    }
    
    func fetchMockData(url: String) {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        
        mockArtistsViewModelObj.fetchData(url: url) {
            DispatchQueue.main.async {
//                self.activityIndicator.startAnimating()
//                self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                self.hud.animationType = .fade
                self.tableView.reloadData()
//                self.activityIndicator.stopAnimating()
                self.hud.hide(animated: true)
            }
        }
    }
}
