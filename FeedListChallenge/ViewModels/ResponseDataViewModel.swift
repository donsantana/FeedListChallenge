//
//  ResponseDataViewModel.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import SwiftUI

struct ResponseDataViewModel {
  @State var responseData: ResponseData!
  
  func getAfterLink()->String{
    return responseData.after!
  }
  
  func getFeedItemList()->[FeedItemViewModel]{
    var feedItemsViewModelList: [FeedItemViewModel] = []
    for feedItem in responseData.feedItems{
      let feedItemViewModel = FeedItemViewModel(feedItem: feedItem)
      feedItemsViewModelList.append(feedItemViewModel)
    }
    return feedItemsViewModelList
  }
}
