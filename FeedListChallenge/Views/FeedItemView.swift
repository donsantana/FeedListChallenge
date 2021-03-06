//
//  FeedItemView.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import Foundation
import SwiftUI

struct FeedItemView: View {
  
  var feedViewModel: FeedViewModel
  @ObservedObject var imageLeader = ImageLoaderService()
  @State var image: UIImage = UIImage(named: "noImage")!
  
  var body: some View{
      //shadow(color: .gray, radius: 0, x: 0.0, y: 0.0)
      VStack(alignment: .leading){
        Text("\(feedViewModel.feed.category)").fontWeight(.regular).textCase(.uppercase).font(.system(size: 14)).foregroundColor(.gray)
        Text("\(feedViewModel.feed.title)").fontWeight(.medium)
          .font(.system(size: 17))
          .fixedSize(horizontal: false, vertical: true)
        Image(uiImage: self.image)
          .resizable()
          .onAppear {
            imageLeader.loadImage(for: feedViewModel.feed.image, completion: { image in
              self.image = image
            })
          }
          .frame(width: feedViewModel.imageSizeFloat().first, height: feedViewModel.imageSizeFloat().last, alignment: .center)
        Group{
          HStack{
            HStack{
              Image("upArrow")
              Text(feedViewModel.getScore()).font(.footnote)
              Image("downArrow")
            }.foregroundColor(Color(.lightGray))
            Spacer()
            HStack{
              Image("comment")
              Text("\(feedViewModel.feed.numComments)").font(.footnote)
            }.foregroundColor(Color(.lightGray))
            Spacer()
            HStack{
              Image("shareIcon")
              Text("Share").font(.footnote)
            }.foregroundColor(Color(.lightGray))
          }
        }.padding(EdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 5))
      }
  }
}
