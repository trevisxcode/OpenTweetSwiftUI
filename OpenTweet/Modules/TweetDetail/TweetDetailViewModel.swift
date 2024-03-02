//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

extension TweetDetailView {
  final class Model: ObservableObject {
    let service = TweetsService()
    
    let id: String
    let profileName: String
    let username: String
    let content: String
    let avatar: URL?
    let inReplyTo: String?
    let date: String
    @Published var replyTweets = [TweetDM]()
    
    init(
      id: String,
      profileName: String,
      username: String,
      content: String,
      avatar: URL?,
      inReplyTo: String?,
      date: String
    ) {
      self.id = id
      self.profileName = profileName
      self.username = username
      self.content = content
      self.avatar = avatar
      self.inReplyTo = inReplyTo
      self.date = date
    }
    
    func fetchReplyTweets() {
      replyTweets = service.fetchTweets(for: id)
    }
    
    func tweetViewModel(for tweet: TweetDM) -> TweetView.Model {
      TweetView.ModelMapper.map(entity: tweet)
    }
    
    func tweetDetailViewModel(for tweet: TweetDM) -> TweetDetailView.Model {
      TweetDetailView.ModelMapper.map(entity: tweet)
    }
    
    static let `default` = Model(
      id: "1",
      profileName: "OpenTweet",
      username: "@opentweet",
      content: "Hi! Welcome to your iOS coding excercise. This is a very simple twitter like client. You'll find a json file under Data/ with a short tweet timeline. You are asked to write the app that will display the tweets, similar to what a Twitter client would do.",
      avatar: nil,
      inReplyTo: nil,
      date: "29/2/24"
    )
  }
}
