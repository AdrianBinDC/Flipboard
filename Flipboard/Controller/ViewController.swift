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
  
  @IBOutlet weak var tabBar: UITabBar!
  @IBOutlet weak var homeButton: UITabBarItem!
  @IBOutlet weak var followingButton: UITabBarItem!
  @IBOutlet weak var exploreButton: UITabBarItem!
  @IBOutlet weak var notificationButton: UITabBarItem!
  @IBOutlet weak var profileButton: UITabBarItem!
  
  // MARK: Variables
  var dataSource: [NewsCategory]!
  
  // MARK: Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    
    // populate data source
    let dataFactory = DataFactory()
    dataSource = dataFactory.generateData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tabBar.invalidateIntrinsicContentSize()
  }
  
  // MARK: IBActions
  
}

// MARK: UITabBarDelegate

extension ViewController: UITabBarDelegate {
  func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    guard tabBar.selectedItem != item else { return }
    switch item {
    case self.homeButton:
      print("homeButton")
      break
    case self.followingButton:
      print("followingButton")
      break
    case self.exploreButton:
      print("exploreButton")
      break
    case self.notificationButton:
      print("notificationButton")
      break
    case self.profileButton:
      print("profileButton")
      break
    default:
      break
    }
    }
}
