//
//  HomeViewTableViewCell.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/10/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class HomeViewTableViewCell: UITableViewCell {

  @IBOutlet weak var headlineLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
