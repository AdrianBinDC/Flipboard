//
//  HomeView.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/10/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class HomeView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  
  func commonInit() {
    Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
}
