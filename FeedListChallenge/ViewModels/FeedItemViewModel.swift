//
//  FeedItemViewModel.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import SwiftUI

struct FeedItemViewModel {
  @State var feedItem: FeedItem

  func id()->String{
    return feedItem.id.uuidString
  }
  
  func getFeed()->FeedViewModel{
    return FeedViewModel(feed: feedItem.feed)
  }
}
