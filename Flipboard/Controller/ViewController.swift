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
    
    // populate data source
    let dataFactory = DataFactory()
    dataSource = dataFactory.generateData()
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
