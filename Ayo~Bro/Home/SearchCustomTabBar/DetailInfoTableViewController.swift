//
//  DetailInfoTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 05/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
import Foundation

class DetailInfoTableViewController: UITableViewController {
    var originData : PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside?
    var detailInfo: [PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside] = []
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        let contentId = originData?.contentid
        detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId!)
        let detailData = detailInfo[0]
        super.viewDidLoad()
        titleLabel.text = detailData.title
        addressLabel.text = detailData.addr1
        explainLabel.text = detailData.overview
        
        let queueSub = OperationQueue()
        
        if let stringURL = detailData.firstimage2 {
            let url = URL(string: stringURL)!
            queueSub.addOperation {
                let image = try! Data(contentsOf: url)
                
                OperationQueue.main.addOperation {
                    self.Image.image = UIImage(data: image)
                }
            }
        }
    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    //        return 5
    //    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    //
    //        if indexPath.row == 0 {
    //            cell.imageView?.image = UIImage(named: "busan")
    ////            cell.imageView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    ////            cell.imageView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    ////            cell.imageView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    ////            cell.imageView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    //            cell.imageView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    //            cell.imageView?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    //            cell.backgroundColor = UIColor.lightGray
    //        }
    //        else if indexPath.row == 1 {
    //            cell.textLabel?.text = "\(indexPath.row)"
    //        }
    //        else if indexPath.row == 2 {
    //            cell.backgroundColor = UIColor.lightGray
    //        }
    //        else if indexPath.row == 3 {
    //            cell.textLabel?.text = "\(indexPath.row)"
    //        }
    //        else {
    //            cell.textLabel?.text = "\(indexPath.row)"
    //        }
    //        return cell
    //    }
    
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.row == 0 {
    //            return 200
    //        }
    //        else if indexPath.row == 1 {
    //            return 100
    //        }
    //        else if indexPath.row == 2 {
    //            return 200
    //        }
    //        else if indexPath.row == 3 {
    //            return 300
    //        }
    //        else {
    //            return 100
    //        }
    //    }
    
}
