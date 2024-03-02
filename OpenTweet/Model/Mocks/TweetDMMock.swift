//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import Foundation

extension TweetDM {
  static var mock = TweetDM(
    id: "1",
    author: "@opentweet",
    content: "Hi! Welcome to your iOS coding excercise. This is a very simple twitter like client. You'll find a json file under Data/ with a short tweet timeline. You are asked to write the app that will display the tweets, similar to what a Twitter client would do.",
    avatar: nil,
    inReplyTo: nil,
    date: Date()
  )
  
}
