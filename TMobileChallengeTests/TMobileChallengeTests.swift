//
//  TMobileChallengeTests.swift
//  TMobileChallengeTests
//
//  Created by Donelkys Santana on 9/1/21.
//

import XCTest
@testable import TMobileChallenge

class TMobileChallengeTests: XCTestCase {
  var feed: Feed!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      feed = Feed(id: "1", title: "Title Test", category: "category1", image: "http://test.com/image.png", imageWidth: 120, imageHeight: 120, score: 100, numComments: 1000)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  func testAttributes(){
    XCTAssertEqual(feed.id, "1")
    XCTAssertEqual(feed.title, "Title Test")
    XCTAssertEqual(feed.category, "category1")
    XCTAssertEqual(feed.image, "http://test.com/image.png")
    XCTAssertEqual(feed.imageWidth, 120)
    XCTAssertEqual(feed.imageHeight, 120)
    XCTAssertEqual(feed.score, 100)
    XCTAssertEqual(feed.numComments, 1000)
  }

}
