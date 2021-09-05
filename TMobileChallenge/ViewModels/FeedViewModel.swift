//
//  FeedViewModel.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import SwiftUI

struct FeedViewModel{
  
  @State var feed: Feed
  
  func imageSizeFloat() -> [CGFloat] {
    print("imageSize-\(feed.image.contains("https://"))")
    if feed.image.contains("https://"){
      return [CGFloat(feed.imageWidth!),CGFloat(feed.imageHeight!)]
    }
    
    return [CGFloat(120),CGFloat(120)]
  }
  
  func getScore() -> String {
    return feed.score < 1000 ? String(feed.score) : "\(Double(feed.score)/1000.0)k"
  }
}
