//
//  LocalTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_14 on 24/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class LocalTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        regionRegion.selectedIndex = indexPath.row - 1
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return regionRegion.RegionInformation.count + 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath)
        if indexPath.row == 0{
            cell.textLabel?.text = "전국"
        }
        else {
            cell.textLabel?.text = regionRegion.RegionInformation[indexPath.row - 1].region
        }
        return cell
    }

}