//
//  Data.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/1/21.
//

import Foundation

struct ResponseData: Decodable, Identifiable {
  var id = UUID()
  var after, modhash, before: String?
  var dist: Int
  var feedItems: [FeedItem]
  
  private enum CodingKeys: String, CodingKey{
    case after
    case modhash
    case dist
    case feedItems = "children"
    case before
  }
  
}
