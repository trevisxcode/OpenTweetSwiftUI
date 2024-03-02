//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import XCTest
@testable import OpenTweet

final class TweetContentTextModelMapperTests: XCTestCase {
  
  typealias Mapper = TweetContentText.ModelMapper
  
  func testPlainTextMapping() {
    // given
    let tweet = "Long day at opentable!\nShipped a great update, should be on the store next week"
    
    // when
    let viewModel = Mapper.map(text: tweet)
    
    // then
    XCTAssertEqual(viewModel.text, tweet)
    XCTAssertTrue(viewModel.mentions.isEmpty)
    XCTAssertTrue(viewModel.links.isEmpty)
  }
  
  func testSingleMentionMapping() {
    // given
    let tweet = "@opentable Long day at opentable!\nShipped a great update, should be on the store next week"
    
    // when
    let viewModel = Mapper.map(text: tweet)
    
    // then
    XCTAssertEqual(viewModel.text, tweet)
    XCTAssertEqual(viewModel.mentions, ["@opentable"])
    XCTAssertTrue(viewModel.links.isEmpty)
  }
  
  func testMultipleMentionsMapping() {
    // given
    let tweet = "@opentable Long day at opentable!\n@olarivain Shipped a great update, should be on the store next week"
    
    // when
    let viewModel = Mapper.map(text: tweet)
    
    // then
    XCTAssertEqual(viewModel.text, tweet)
    XCTAssertEqual(viewModel.mentions, ["@opentable", "@olarivain"])
    XCTAssertTrue(viewModel.links.isEmpty)
  }
  
  func testMentionsWithLinkMapping() {
    // given
    let tweet = "@opentable Long day at opentable!\n@olarivain Shipped a great update, should be on the store next week.\nhttps://itunes.apple.com/us/app/opentable/id296581815?mt=8"
    
    // when
    let viewModel = Mapper.map(text: tweet)
    
    // then
    XCTAssertEqual(viewModel.text, tweet)
    XCTAssertEqual(viewModel.mentions, ["@opentable", "@olarivain"])
    XCTAssertEqual(viewModel.links, ["https://itunes.apple.com/us/app/opentable/id296581815?mt=8"])
  }
  
  func testMentionsWithMultipleLinksMapping() {
    // given
    let tweet = "https://www.youtube.com/watch?v=kGksOajfU_U\n@opentable Long day at opentable!\n@olarivain Shipped a great update, should be on the store next week.\nhttps://itunes.apple.com/us/app/opentable/id296581815?mt=8"
    
    // when
    let viewModel = Mapper.map(text: tweet)
    
    // then
    XCTAssertEqual(viewModel.text, tweet)
    XCTAssertEqual(viewModel.mentions, ["@opentable", "@olarivain"])
    XCTAssertEqual(
      viewModel.links,
      [
        "https://www.youtube.com/watch?v=kGksOajfU_U",
        "https://itunes.apple.com/us/app/opentable/id296581815?mt=8"
      ]
    )
  }

}
