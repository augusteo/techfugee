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
    }
  }
}

// data source
extension ConnectViewController {
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
