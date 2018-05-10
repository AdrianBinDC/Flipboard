//
//  DataFactory.swift
//  Flipboard
//
//  Created by Adrian Bolinger on 5/9/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

struct NewsCategory {
  let title: String
  let subTitle: String
}

class DataFactory: NSObject {
  
  private let categoryList = ["news", "business", "technology", "sports", "politics", "conservative view", "liberal view", "science", "celebrity news", "recipes", "skateboarding", "design", "fashion", "computer science", "photography", "weather", "healthy eating", "women's news", "beauty", "mindfulness", "world economy", "sustainability", "street art", "music", "music festivals", "tv", "movies", "cool stuff", "workouts", "home", "classical music", "fortune 500", "gaming"]
  
  func generateData() -> [NewsCategory] {
    var dataArray: [NewsCategory] = []
    
    var randomNumberArray: [Int] = []
    
    for _ in 0..<categoryList.count {
      randomNumberArray.append(Int().randomNumber(inRange: 350_000...10_000_000))
    }
    
    let consolidatedData = zip(categoryList, randomNumberArray)
    
    consolidatedData.forEach { category, number in
      var numberString: String = ""
      switch number {
      case 0...999_000:
        numberString = String(number / 100_000) + "k reading about this"
      default:
        numberString = String(number / 1_000_000) + "M reading about this"
      }
      
      let newsCategory = NewsCategory(title: category, subTitle: numberString)
      
      dataArray.append(newsCategory)
    }
    
    print(dataArray)
    return dataArray
  }
  
  // Generate random numbers to populate NewsCategory structs
//  public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
//    let length = Int64(range.upperBound - range.lowerBound + 1)
//    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
//    return T(value)
//  }
}
