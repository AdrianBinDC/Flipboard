//
//  AnimatedTabBar.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/13/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

protocol AnimatedTabBarDelegate: class {
  func scrollToViewIndex(_ index: Int)
}

class AnimatedTabBar: UIView {
  
  @IBOutlet var contentView: UIView!
  
  @IBOutlet weak var tabBar: UITabBar!
  
  // UITabBarItems
  @IBOutlet weak var homeButton: UITabBarItem!
  @IBOutlet weak var followingButton: UITabBarItem!
  @IBOutlet weak var exploreButton: UITabBarItem!
  @IBOutlet weak var notificationButton: UITabBarItem!
  @IBOutlet weak var profileButton: UITabBarItem!
  
  @IBOutlet weak var tabIndicator: UIView!
  
  weak var delegate: AnimatedTabBarDelegate?
  
  private var sortedTabViews: [UIView] = []
  
  private var currentlySelectedIndex: Int = 0 {
    willSet {
      sortedTabViews[newValue].isUserInteractionEnabled = false
    }
    
    didSet {
      sortedTabViews[oldValue].isUserInteractionEnabled = true
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  func commonInit() {
    Bundle.main.loadNibNamed("AnimatedTabBar", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    contentView.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1) // match tab bar color via Color Literal + dropper
    backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1) // match tab bar color via Color Literal + dropper
    tintColor = UIColor.white
    
    tabBar.delegate = self
    
    // Sorts UITabBarItems' midX in ascending order and assigns to array that's referenced for UIAnimation
    sortedTabViews = tabBar.subviews.sorted(by: { (view1, view2) -> Bool in
      view1.frame.midX < view2.frame.midX
    })
    
    tabIndicator.backgroundColor = accentRed
    tabBar.selectedItem = homeButton
    currentlySelectedIndex = 0
  }
  
  func updateTabIndicator(_ item: UITabBarItem, animated: Bool) {
    delegate?.scrollToViewIndex(item.tag)
    let newCenterX: CGFloat = sortedTabViews[item.tag].center.x
    let newCenter = CGPoint(x: newCenterX, y: tabIndicator.center.y)
    
    if animated {
      UIView.animate(withDuration: 0.3) {
        self.tabIndicator.center = newCenter
      }
    } else {
      self.tabIndicator.center = newCenter
    }
  }
}

extension AnimatedTabBar: UITabBarDelegate {
  func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    guard item.tag != currentlySelectedIndex else { print("doing nothing"); return }
    currentlySelectedIndex = item.tag
    updateTabIndicator(item, animated: true)
  }
}
