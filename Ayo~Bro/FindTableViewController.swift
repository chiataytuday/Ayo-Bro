//
//  FindTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 31/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {

    var selectedIndex:Int = 0
    
    @IBOutlet var resultRegionValue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultRegionValue.titleLabel?.text = regionRegion.regionRegion[regionRegion.selectedIndex].region

    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return regionRegion.regionRegion.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = regionRegion.regionRegion[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell") as! RightImageTableViewCell

        cell.labelRegion?.text = info.region
        cell.labelExplain?.text = info.Explain
        cell.viewImage?.image = info.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        //        print(arrayLocation[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        segue.source
        //        segue.identifier
        if segue.identifier == "SegueToDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let vc = segue.destination as! DetailRegionInfoViewController
            
            vc.infoRegion = regionRegion.regionRegion[indexPath.row]
        }
        
        
    }

}
