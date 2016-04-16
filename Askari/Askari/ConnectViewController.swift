//
//  ConnectViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class ConnectViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Connect"
      // Do any additional setup after loading the view.
  }
}

// delegate
extension ConnectViewController {
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 1 {
      performSegueWithIdentifier("showLiveChat", sender: nil)
    } else {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
  }
}

// data source
extension ConnectViewController {
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 2 : 3
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCellWithIdentifier("requestCell") as! RequestCell
      cell.profilePic.image = UIImage(named: "profilePic")
      switch indexPath.row {
      case 0:
        cell.infoLabel.text = "Jane Jackson - IT"
      default:
        cell.infoLabel.text = "Kosa Lina - Hospitality"
      }
      return cell
    } else {
      let cell = tableView.dequeueReusableCellWithIdentifier("confirmedCell") as! ConfirmedCell
      cell.profilePic.image = UIImage(named: "profilePic")
      switch indexPath.row {
      case 0:
        cell.infoLabel.text = "Bob Smith - Marketing"
      case 1:
        cell.infoLabel.text = "Rachel Brown - Accounting"
      default:
        cell.infoLabel.text = "Barry Augmon - Retail"
      }
      return cell
    }
  }
}
