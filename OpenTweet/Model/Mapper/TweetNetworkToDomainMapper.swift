//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

struct TweetNetworkToDomainMapper {
  static func map(entity tweet: TweetEntity) -> TweetDM {
    TweetDM(
      id: tweet.id,
      author: tweet.author,
      content: tweet.content,
      avatar: tweet.avatar,
      inReplyTo: tweet.inReplyTo,
      date: ISO8601DateFormatter().date(from: tweet.date) ?? Date() // formatDate(date: tweet.date)
    )
  }

}
