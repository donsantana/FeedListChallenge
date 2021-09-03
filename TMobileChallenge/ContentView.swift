//
//  ContentView.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/1/21.
//

import SwiftUI

struct ContentView: View {
  var apiService = ApiService()
  @State var responseDataViewModel: ResponseDataViewModel!
  
  var body: some View {
    NavigationView{
      if responseDataViewModel != nil{
        List(responseDataViewModel.getFeedItemList(),id: \.feedItem.id){ feedItem in
          FeedItemView(feedViewModel: feedItem.getFeed())
            .onAppear(){
              let thresholdIndex = responseDataViewModel.getFeedItemList().index(responseDataViewModel.getFeedItemList().endIndex, offsetBy: -1)
              if responseDataViewModel.getFeedItemList().firstIndex(where: { $0.id() == feedItem.id() }) == thresholdIndex {
                print("Get More")
                apiService.getScrollFeedsAPI(afterLink: responseDataViewModel.getAfterLink(), completion: {(responseDataViewModel) in
                  self.responseDataViewModel = responseDataViewModel
                })
              }
            }
        }
        .navigationTitle(Text("Feeds"))
      }else{
        ProgressView()
      }
    }
    .onAppear(){
      apiService.getScrollFeedsAPI(afterLink: nil, completion: {(responseDataViewModel) in
        self.responseDataViewModel = responseDataViewModel
      })
    }
  }
  
//  var apiService = ApiService()
//  @State var feedList = [FeedItem]()
//
//  var body: some View {
//    NavigationView{
//      List(feedList, id: \.id){ feedItem in
//        FeedItemView(feedViewModel: FeedViewModel(feed:feedItem.feed))
//          .onAppear(){
//            let thresholdIndex = feedList.index(feedList.endIndex, offsetBy: -1)
//            if feedList.firstIndex(where: { $0.id == feedItem.id }) == thresholdIndex {
//              print("Get More")
//            }
//          }
//      }
//      .onAppear(){
//        print("Index \(feedList.endIndex)")
//        apiService.getFeedsAPI(completion: {(feeds) in
//          self.feedList = feeds
//        })
//      }
//      .navigationTitle(Text("Feeds"))
//    }
//  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
