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
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var tabBar: UITabBar!
  @IBOutlet weak var homeButton: UITabBarItem!
  @IBOutlet weak var followingButton: UITabBarItem!
  @IBOutlet weak var exploreButton: UITabBarItem!
  @IBOutlet weak var notificationButton: UITabBarItem!
  @IBOutlet weak var profileButton: UITabBarItem!
  
  // MARK: Variables
  var viewArray: [UIView]!
  
  var currentlySelectedButton: UITabBarItem!
  
  // MARK: Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tabBar.invalidateIntrinsicContentSize()
    configureCollectionView()
    configureDummyViews()
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
  
  fileprivate func configureTabBar() {
    // configure the tab bar
    tabBar.delegate = self
    tabBar.selectedItem = homeButton
    
    // compute screen width to determine offset of UITabBar
    let screenSize = self.view.bounds
    
    [homeButton, followingButton, exploreButton, notificationButton, profileButton].forEach { tabBarItem in
      // screen dimensions of iPhone X
      if screenSize.width == 375 && screenSize.height == 812 {
        // FIXME: displays icorrectly on iPhone X
        // could be icon size or could be bug, diagnose to determine which
        tabBarItem?.imageInsets = UIEdgeInsetsMake(18, 0, 0, 0)
      }
        // non-iPhone X
      else {
        tabBarItem?.imageInsets = UIEdgeInsetsMake(12, 6, 0, 6)
      }
    }
    
    currentlySelectedButton = homeButton
  }
  
  // MARK: Test Methods
  
  func configureDummyViews() {
    viewArray = []
    var colorArray: [UIColor] = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue]
    for index in 0..<5 {
      let view = UIView(frame: collectionView.bounds)
      view.backgroundColor = colorArray[index]
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
      label.text = "Dummy View \(index + 1)"
      label.sizeToFit()
      label.center = view.center
      view.addSubview(label)
      view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      viewArray.append(view)
    }
  }
  
  // MARK: IBActions
  
}

// MARK: UITabBarDelegate

extension ViewController: UITabBarDelegate {
  func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    guard currentlySelectedButton != item else { return }
    
    var destinationIndex: IndexPath?
    
    switch item {
    case self.homeButton:
      destinationIndex = IndexPath(row: 0, section: 0)
    case self.followingButton:
      destinationIndex = IndexPath(row: 1, section: 0)
    case self.exploreButton:
      destinationIndex = IndexPath(row: 2, section: 0)
    case self.notificationButton:
      destinationIndex = IndexPath(row: 3, section: 0)
    case self.profileButton:
      destinationIndex = IndexPath(row: 4, section: 0)
    default:
      break
    }
    
    currentlySelectedButton = item
    
    collectionView.scrollToItem(at: destinationIndex!, at: .centeredHorizontally, animated: true)
  }
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
    return viewArray.count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "View", for: indexPath) as! PageCollectionViewCell
    let view = viewArray[indexPath.row]
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
