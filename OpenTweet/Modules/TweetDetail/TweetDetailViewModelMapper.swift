//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import Foundation

extension TweetDetailView {
  struct ModelMapper {
    static func map(entity tweet: TweetDM) -> TweetDetailView.Model {
      TweetDetailView.Model(
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
      dateFormatter.dateFormat = "h.mm a · d/MM/yy"
      return dateFormatter.string(from: date)
    }
  }
  
}
