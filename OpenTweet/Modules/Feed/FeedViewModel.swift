//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

extension FeedView {
  final class Model: ObservableObject {
    let service = TweetsService()
    @Published private(set) var tweetViewModels = [TweetView.Model]()
    
    func fetchTweet() {
      let tweets = service.fetchTweets()
      tweetViewModels = tweets.map {
        TweetView.ModelMapper.map(entity: $0)
      }
    }
  }
}
