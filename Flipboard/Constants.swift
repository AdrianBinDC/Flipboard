//
//  Constants.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/11/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

enum FontString: String {
  case sourceSansProRegular = "SourceSansPro-Regular"
  case firaSansCondensedBold = "FiraSansCondensed-Bold"
  case firaSansCondensedExtraBold = "FiraSansCondensed-ExtraBold"
}


// MARK: Colors

var accentRed: UIColor {
  let color = #colorLiteral(red: 0.937254902, green: 0.0431372549, blue: 0.1254901961, alpha: 1)
  return color
}

var placeHolderColor: UIColor {
  let color = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8705882353, alpha: 1)
  return color
}

// MARK: Icon Strings

enum IconString: String {
  case blankIcon = "blank-icon"
  case caption = "caption"
  case fourSquares = "four-squares"
  case homeIcon = "homeIcon"
  case magnifyingGlass = "magnifying-glass"
  case person = "person"
}
