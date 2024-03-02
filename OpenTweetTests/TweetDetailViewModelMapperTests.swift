//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import XCTest
@testable import OpenTweet

final class TweetDetailViewModelMapperTests: XCTestCase {
  
  typealias Mapper = TweetDetailView.ModelMapper
  
  func testMapping() {
    // given
    let tweet = TweetDM(
      id: "1",
      author: "@mkbhd",
      content: "Hello, world!",
      avatar: URL(string: "https://example.com/avatar.jpg"),
      inReplyTo: nil,
      date: mockDate
    )
    
    // when
    let viewModel = Mapper.map(entity: tweet)
    
    // then
    XCTAssertEqual(viewModel.id, tweet.id)
    XCTAssertEqual(viewModel.profileName, "Mkbhd")
    XCTAssertEqual(viewModel.username, tweet.author)
    XCTAssertEqual(viewModel.avatar, tweet.avatar)
    XCTAssertEqual(viewModel.date, "9.42 AM · 30/09/20")
    XCTAssertNil(viewModel.inReplyTo)
  }
  
  private var mockDate: Date {
    var components = DateComponents()
    components.year = 2020
    components.month = 9
    components.day = 30
    components.hour = 9
    components.minute = 42
    components.second = 0
    components.timeZone = TimeZone(identifier: "America/Los_Angeles")
    
    // Create a calendar instance
    let calendar = Calendar.current
    
    // Get the date from the components
    return calendar.date(from: components) ?? Date()
  }
  
}
