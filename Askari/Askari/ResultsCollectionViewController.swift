//
//  ResultsCollectionViewController.swift
//  Askari
//
//  Created by Pk Heng on 16/04/2016.
//  Copyright © 2016 Pk Heng. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "resultCell"

class ResultsCollectionViewController: UICollectionViewController {

  var viewModel = MentorViewModel()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.tabBarItem.title = "Mentor"
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    viewModel.fetchMentees(failure: { error in
      print("\(error.localizedDescription)")
    }) {
      self.collectionView?.reloadData()
    }
      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false

      // Register cell classes
      self.collectionView?.registerNib(UINib(nibName: "ResultCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    self.collectionView?.backgroundColor = UIColor.whiteColor()

      // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using [segue destinationViewController].
      // Pass the selected object to the new view controller.
  }
  */

  // MARK: UICollectionViewDataSource

  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
      return 1
  }


  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
      return viewModel.modelList.count
  }

override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ResultCollectionCell
  
  let mentee = viewModel.modelList[indexPath.row]
  
  /* Substitute this with the entity results */
  cell.nameLbl.text = mentee.name
  cell.titleLbl.text = mentee.title
  cell.imgView.kf_setImageWithURL(NSURL(string: mentee.photo)!, placeholderImage: UIImage(named: "profilePic"))

    return cell
  }
  
  
  // MARK: UICollectionViewDelegate

  /*
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment this method to specify if the specified item should be selected
  override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
  override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
      return false
  }

  override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
      return false
  }

  override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
  
  }
  */

}

extension ResultsCollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(180.0, 200.0)
  }
 
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let sharedProfileVC = ShareProfileViewController(nibName: "ShareProfileViewController", bundle: nil)
    navigationController?.pushViewController(sharedProfileVC, animated: true)
  }
}

