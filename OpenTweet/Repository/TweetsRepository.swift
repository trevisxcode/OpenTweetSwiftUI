//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

final class TweetsRepository {
  var tweets = [TweetEntity]()
  
  init() {
    loadTweets()
  }
  
  private func loadTweets() {
    guard let url = Bundle.main.url(forResource: "timeline", withExtension: "json") else {
      return
    }
    
    do {
      let data = try Data(contentsOf: url)
      let response =  try JSONDecoder().decode(TweetsResponse.self, from: data)
      tweets = response.timeline
    } catch {
      print("TweetsRepository - Fail to parse response: \(error)")
    }
  }
  
  func fetchTweets() -> [TweetEntity] {
    tweets.filter { $0.inReplyTo == nil }
  }
  
  func fetchTweets(for inReplyTo: String) -> [TweetEntity] {
    tweets.filter { $0.inReplyTo == inReplyTo }
  }
}
