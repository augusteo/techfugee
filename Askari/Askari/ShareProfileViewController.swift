//
//  ShareProfileViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit

class ShareProfileViewController: UIViewController {

  @IBOutlet weak var profileImgView: UIImageView!
  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var professionLbl: UILabel!
  @IBOutlet weak var locationLbl: UILabel!
  
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdge.None
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    refreshDetails()
  }

  func refreshDetails() {
    
    print(EntityManager.shareInstance.entity)
    
    nameLbl.text = EntityManager.shareInstance.entity?.name
    professionLbl.text = EntityManager.shareInstance.getProfession()
    locationLbl.text = EntityManager.shareInstance.getLocation()
  }
  
  
}
