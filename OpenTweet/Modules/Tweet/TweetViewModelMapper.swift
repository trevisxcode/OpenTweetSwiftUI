//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import Foundation

extension TweetView {
  struct ModelMapper {
    static func map(entity tweet: TweetDM) -> TweetView.Model {
      TweetView.Model(
        id: tweet.id,
        profileName: tweet.author.dropFirst().capitalized,
        username: tweet.author,
        content: tweet.content,
        avatar: tweet.avatar,
        inReplyTo: tweet.inReplyTo,
        date: formatDate(tweet.date)
      )
    }
    
    private static func formatDate(_ date: Date) -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "d/M/yy"
      return dateFormatter.string(from: date)
    }
  }
  
}
