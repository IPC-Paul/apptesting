//
//  SearchViewController.swift
//  Testing
//
//  Created by Paul Benbrook on 4/13/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchResultTable: UITableView!
    
    var searchResults : [Movie] = []
    var isSearching : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchMovies()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        SearchMovies()
    }
    
    func SearchMovies() {
        searchResults = []
        if !(searchBar.text?.isEmpty)! && searchBar.text != " " && searchBar.text != "" {
            for i in 0 ..< movies.count {
                var allocated = false
                if movies[i].title.containsString(searchBar.text!) && !allocated {
                    searchResults.append(movies[i])
                    allocated = true
                    // searchResults[searchResults.count - 1].title = ""
                }
                if (movies[i].blurb.containsString(searchBar.text!)) && !allocated {
                    searchResults.append(movies[i])
                    allocated = true
                }
            }
        } else {
            searchResults = movies
        }
        searchResultTable.reloadData()
        
        for p in 0 ..< searchResults.count {
            print(searchResults[p].title)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let searchCell = searchResultTable.dequeueReusableCellWithIdentifier("searchCell") as! SearchTableViewCell
        
        searchCell.searchResultLabel.text = searchResults[indexPath.row].title
        searchCell.searchResultBlurb.text = searchResults[indexPath.row].blurb
        
        return searchCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        isSearching = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
