//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import SwiftUI

struct TweetContentText: View {
  var viewModel: TweetContentText.Model
  
  var body: some View {
    Text(attributedString)
  }
  
  private var attributedString: AttributedString {
    var attributedString = AttributedString(viewModel.text)
    
    for mention in viewModel.mentions {
      if let range = attributedString.range(of: mention) {
        attributedString[range].foregroundColor = .blue
      }
    }
    
    for link in viewModel.links {
      if let range = attributedString.range(of: link) {
        attributedString[range].foregroundColor = .blue
        attributedString[range].link = .init(string: link)
      }
    }

    return attributedString
  }
}

#Preview {
  TweetContentText(viewModel: .default)
}
