//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

final class TweetsService {
  private let repository = TweetsRepository()
  
  func fetchTweets() -> [TweetDM] {
    repository.fetchTweets().map {
      TweetNetworkToDomainMapper.map(entity: $0)
    }
  }
  
  func fetchTweets(for inReplyTo: String) -> [TweetDM] {
    repository.fetchTweets(for: inReplyTo).map {
      TweetNetworkToDomainMapper.map(entity: $0)
    }.sorted { $0.date > $1.date }
  }
}
