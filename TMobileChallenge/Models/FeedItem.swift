//
//  FeedItem.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import Foundation

struct FeedItem: Decodable, Identifiable {
  let id = UUID()
  var kind: String
  var feed: Feed
  
  private enum CodingKeys: String, CodingKey{
    case kind
    case feed = "data"
  }
}
