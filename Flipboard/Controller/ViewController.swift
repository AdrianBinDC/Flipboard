//
//  ViewController.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/9/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

// This is the explore screen

class ViewController: UIViewController {
  
  // MARK: IBOutlets
  
  // FIXME: create your own search bar
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var tabBar: AnimatedTabBar!
  
  
  // MARK: Variables
  var pageViewArray: [UIView]!
  
  var currentlySelectedButton: UITabBarItem!
  
  // MARK: Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setToolbarHidden(true, animated: false)
    tabBar.delegate = self
    //    configureTabBar()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    //    self.tabBar.invalidateIntrinsicContentSize()
    configureCollectionView()
    configurePages()
  }
  
  // MARK: Configuration Methods
  
  fileprivate func configureCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    collectionView.isScrollEnabled = false
  }
  
  //  fileprivate func configureTabBar() {
  //    // configure the tab bar
  //    tabBar.delegate = self
  ////    tabBar.selectedItem = homeButton
  //
  //    // compute screen width to determine offset of UITabBar
  //    let screenSize = self.view.bounds
  //
  //    [homeButton, followingButton, exploreButton, notificationButton, profileButton].forEach { tabBarItem in
  //      // screen dimensions of iPhone X
  //      if screenSize.width == 375 && screenSize.height == 812 {
  //        // FIXME: displays icorrectly on iPhone X
  //        // could be icon size or could be bug, diagnose to determine which
  //        // Looks good, doesn't respond well
  //        // tabBarItem?.imageInsets = UIEdgeInsets(top: 18, left: 3, bottom: -18, right: 3)
  ////        tabBarItem?.imageInsets = UIEdgeInsets(top: 12, left: 4, bottom: -12, right: 4)
  //        tabBarItem?.imageInsets = UIEdgeInsets(top: 12, left: 4, bottom: -8, right: 4)
  //
  //      }
  //        // non-iPhone X
  //      else {
  //        tabBarItem?.imageInsets = UIEdgeInsetsMake(12, 6, 0, 6)
  //      }
  //    }
  //
  //    tabBar.setNeedsDisplay()
  //
  //    currentlySelectedButton = homeButton
  //  }
  
  // MARK: Test Methods
  
  func configurePages() {
    pageViewArray = []
    let homeView = HomeView(frame: collectionView.bounds)
    homeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    homeView.backgroundColor = UIColor.white
    pageViewArray.append(homeView)
    
    var titleArray = ["Following", "Explore", "Notification", "Profile"]
    for index in 0..<4 {
      let view = UIView(frame: collectionView.bounds)
      view.backgroundColor = UIColor.lightGray
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
      label.font = UIFont(name: FontString.firaSansCondensedBold.rawValue, size: 18.0)
      label.text = "\(titleArray[index]) View"
      label.sizeToFit()
      label.center = view.center
      view.addSubview(label)
      view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      pageViewArray.append(view)
    }
  }
  
  // MARK: IBActions
  
}

// MARK: UICollectionViewDelegate methods

extension ViewController: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    collectionView.reloadData()
  }
}

// MARK: UICollectionViewDataSource methods

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pageViewArray.count
  }
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "View", for: indexPath) as! PageCollectionViewCell
    let view = pageViewArray[indexPath.row]
    cell.containerView.addSubview(view)
    return cell
  }
}

// MARK: UICollectionViewDelegateFlowLayout methods

extension ViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

// MARK: AnimatedTabBarDelegate methods

extension ViewController: AnimatedTabBarDelegate {
  func scrollToViewIndex(_ index: Int) {
    let destinationIndex = IndexPath(row: index, section: 0)
    collectionView.scrollToItem(at: destinationIndex, at: .centeredHorizontally, animated: true)
  }
}
