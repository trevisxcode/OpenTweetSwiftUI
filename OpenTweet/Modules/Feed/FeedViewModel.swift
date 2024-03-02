//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

extension FeedView {
  final class Model: ObservableObject {
    struct Constant {
      static let navigationTitle = "OpenX"
    }

    let service = TweetsService()
    let navigationTitle = Constant.navigationTitle
    @Published private(set) var tweets = [TweetDM]()
    
    func fetchTweet() {
      tweets = service.fetchTweets()
    }
    
    func tweetViewModel(for tweet: TweetDM) -> TweetView.Model {
      TweetView.ModelMapper.map(entity: tweet)
    }
    
    func tweetDetailViewModel(for tweet: TweetDM) -> TweetDetailView.Model {
      TweetDetailView.ModelMapper.map(entity: tweet)
    }
  }
}
