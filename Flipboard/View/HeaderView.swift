//
//  HeaderView.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/14/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class HeaderView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var sectionTitle: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  
  func commonInit() {
    Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    sectionTitle.textColor = accentRed
  }

  
}
