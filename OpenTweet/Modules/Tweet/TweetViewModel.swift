//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

extension TweetView {
  final class Model: ObservableObject, Equatable, Hashable {
    let id: String
    let profileName: String
    let username: String
    let avatar: URL?
    let inReplyTo: String?
    let date: String
    let tweetContentTextModel: TweetContentText.Model
    
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
      self.avatar = avatar
      self.inReplyTo = inReplyTo
      self.date = date
      self.tweetContentTextModel = TweetContentText.ModelMapper.map(text: content)
    }
    
    static func == (lhs: Model, rhs: Model) -> Bool {
      lhs.id == rhs.id &&
      lhs.profileName == rhs.profileName &&
      lhs.username == rhs.username &&
      lhs.tweetContentTextModel.text == rhs.tweetContentTextModel.text &&
      lhs.avatar == rhs.avatar &&
      lhs.inReplyTo == rhs.inReplyTo &&
      lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
      hasher.combine(profileName)
      hasher.combine(username)
      hasher.combine(tweetContentTextModel.text)
      hasher.combine(avatar)
      hasher.combine(inReplyTo)
      hasher.combine(date)
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
