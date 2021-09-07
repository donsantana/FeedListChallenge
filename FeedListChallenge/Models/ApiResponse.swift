//
//  Response.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/1/21.
//

import Foundation

struct ApiResponse: Decodable, Identifiable {
  var id = UUID()
  var kind: String
  var data: ResponseData
  
  private enum CodingKeys: String, CodingKey{
    case kind
    case data
  }
}
