//
//  Feed.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/1/21.
//

import Foundation

struct Feed: Decodable, Identifiable {
  let id, title, category: String
  var image = ""
  var imageWidth: Int?
  var imageHeight: Int?
  var score, numComments: Int
  
  private enum CodingKeys: String, CodingKey{
    case id
    case title
    case category = "subreddit"
    case score
    case image = "thumbnail"
    case imageWidth = "thumbnail_width"
    case imageHeight = "thumbnail_height"
    case numComments = "num_comments"
  }
}
