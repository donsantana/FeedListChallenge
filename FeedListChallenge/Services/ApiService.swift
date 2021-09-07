//
//  ApiService.swift
//  FeedListChallenge
//
//  Created by Donelkys Santana on 9/1/21.
//

import Foundation
import UIKit

final class ApiService: ObservableObject {
  
  @Published var responseData: ResponseData!
 
  func getFeedsAPI(completion: @escaping (ResponseData) -> ()){
    print(ApiUrls.getFeedsUrl)
    let request = URLRequest(url: URL(string: ApiUrls.getFeedsUrl)!)
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
      if let error = error {
        print("error \(error.localizedDescription)")
        //self.handlerError(error: error.localizedDescription)
        return
      }

      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        //self.handlerError(error: "Bad Response Status Code")
        return
      }

      if let data = data {
        //pull out the declaration of the decoder object
        let decoder = JSONDecoder()
        //set how we want to interpret dates in the JSON
        decoder.dateDecodingStrategy = .iso8601
        //decode directly to an array of User structs rather than a Response
        if let decodedResponse = try? decoder.decode(ApiResponse.self, from: data) {
          print(decodedResponse.id)
          self.responseData = decodedResponse.data
          DispatchQueue.main.async {
            completion(self.responseData)
          }
          return
        }else{
          print("error JSON")
        }
      }else{
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
      }
    })
    task.resume()
  }
  
//  @Published var feedList: [FeedItem] = []
//
//  func getFeedsAPI(completion: @escaping ([FeedItem]) -> ()){
//    print(ApiUrls.getFeedsUrl)
//    let request = URLRequest(url: URL(string: ApiUrls.getFeedsUrl)!)
//    let session = URLSession.shared
//    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//      if let error = error {
//        print("error \(error.localizedDescription)")
//        //self.handlerError(error: error.localizedDescription)
//        return
//      }
//
//      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//        //self.handlerError(error: "Bad Response Status Code")
//        return
//      }
//
//      if let data = data {
//        //pull out the declaration of the decoder object
//        let decoder = JSONDecoder()
//        //set how we want to interpret dates in the JSON
//        decoder.dateDecodingStrategy = .iso8601
//        //decode directly to an array of User structs rather than a Response
//        if let decodedResponse = try? decoder.decode(ApiResponse.self, from: data) {
//          print(decodedResponse.id)
//          self.feedList = decodedResponse.data.feedItems
//          DispatchQueue.main.async {
//            completion(self.feedList)
//          }
//          return
//        }else{
//          print("error JSON")
//        }
//      }else{
//        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//      }
//    })
//    task.resume()
//  }
  
  func getScrollFeedsAPI(afterLink: String?, completion: @escaping (ResponseDataViewModel) -> ()){
    print(ApiUrls.getScrollFeedsUrl)
    let url = afterLink != nil ? "\(ApiUrls.getScrollFeedsUrl)\(afterLink ?? "")" : ApiUrls.getFeedsUrl
    let request = URLRequest(url: URL(string: url)!)
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
      if let error = error {
        print("error \(error.localizedDescription)")
        return
      }

      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        return
      }

      if let data = data {
        //pull out the declaration of the decoder object
        let decoder = JSONDecoder()
        //set how we want to interpret dates in the JSON
        decoder.dateDecodingStrategy = .iso8601
        //decode directly to an array of User structs rather than a Response
        if let decodedResponse = try? decoder.decode(ApiResponse.self, from: data) {
          self.responseData = decodedResponse.data
          DispatchQueue.main.async {
            completion(ResponseDataViewModel(responseData: self.responseData))
          }
          return
        }else{
          print("error JSON")
        }
      }else{
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
      }
    })
    task.resume()
  }

}

