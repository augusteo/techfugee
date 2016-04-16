//
//  ShareProfileViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit
import Kingfisher

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
  
  func loadModel(model: EntityModel) {
    profileImgView.kf_setImageWithURL(NSURL(string: model.photo)!, placeholderImage: UIImage(named: "profilePic"))
    nameLbl.text = model.name
    professionLbl.text = model.title
    locationLbl.text = model.state
  }

  func refreshDetails() {
    
    print(EntityManager.shareInstance.entity)
    let photoString = "https://i.imgur.com/472tmT2.jpg"
    let photoUrl = NSURL(string: photoString)!
    profileImgView.kf_setImageWithURL(photoUrl, placeholderImage: UIImage(named: "profilePic"))
    nameLbl.text = EntityManager.shareInstance.entity?.name
    professionLbl.text = EntityManager.shareInstance.getProfession()
    locationLbl.text = EntityManager.shareInstance.getLocation()
  }
  
  
}
