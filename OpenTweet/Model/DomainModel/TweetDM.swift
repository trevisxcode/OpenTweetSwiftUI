//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import Foundation

struct TweetDM: Hashable {
  let id: String
  let author: String
  let content: String
  let avatar: URL?
  let inReplyTo: String?
  let date: Date
}
