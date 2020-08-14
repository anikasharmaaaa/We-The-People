//
//  MyProtestTableViewController.swift
//  We The People
//
//  Created by SVD on 8/13/20.
//  Copyright © 2020 Anika Sharma. All rights reserved.
//

import UIKit

class MyProtestTableViewController: UITableViewController, UISearchBarDelegate {

    let data = ["East Palo Alto - Abolish ICE Rally & March - 8/14", "San Francisco - Giants and Warriors Workers Fight Back Protest - 8/14", "San Francisco - Love, Peace, and Justice Banner Drop - 8/15", "San Francisco - Protest Against Anti-Sikh Laws - 8/15", "Monterey City - Demanding Justice for Brutalized Black Prisoners - 8/15", "San Jose - BLM Stand For Justice - 8/15", "Walnut Creek - BLM Peaceful Skate Protest - 8/15", "San Jose - Slow The Row Protest - 8/15", "San Francisco - George Floyd Memorial Sunset Beach Stroll - 8/16", "San Francisco - Defund SFPD Protest - 8/18", "Oakland - March For the Dead - 8/18", "San Francisco - Justice For Breonna Taylor March - 8/21"]
    var filteredData: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        filteredData = data

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
        
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            
            filteredData = data
        }
        else {
            for protest in data {
            
                if protest.lowercased().contains(searchText.lowercased()) {
                
                    filteredData.append(protest)
                }
            }
        }
        
        self.tableView.reloadData()
    }
}
