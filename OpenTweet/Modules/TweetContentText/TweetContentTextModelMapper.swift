//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import Foundation

extension TweetContentText {
  struct ModelMapper {
    struct Constant {
      static var mentionPattern = "@(\\w+)"
    }

    static func map(text: String) -> Model {
      Model(
        text: text,
        mentions: searchMentions(text: text),
        links: searchUrls(text: text)
      )
    }
    
    private static func searchMentions(text: String) -> [String] {
      mapSubstring(
        for: text,
        with: try? NSRegularExpression(pattern: Constant.mentionPattern, options: [])
      )
    }
    
    private static func searchUrls(text: String) -> [String] {
      mapSubstring(
        for: text,
        with: try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
      )
    }
    
    private static func mapSubstring(
      for text: String,
      with regex: NSRegularExpression?
    ) -> [String] {
      guard let regex else { return [] }
      
      let matches = regex.matches(in: text, options: [], range: initialRange(for: text))
      return matches.map { match in
        let usernameRange = match.range(at: .zero)
        return (text as NSString).substring(with: usernameRange)
      }
    }
    
    private static func initialRange(for text: String) -> NSRange {
      NSRange(location: .zero, length: text.count)
    }
    
  }
}
