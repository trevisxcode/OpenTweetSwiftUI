//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import Foundation

extension TweetContentText {
  struct Model {
    let text: String
    let mentions: [String]
    let links: [String]
    
    static var `default` = Model(
      text: "@olarivain OMG where have YOU been all my life?\nhttps://itunes.apple.com/us/app/opentable/id296581815?mt=8",
      mentions: ["@olarivain"],
      links: ["https://itunes.apple.com/us/app/opentable/id296581815?mt=8"]
    )
  }
}
