//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

@main
struct OpenTweetApp: App {
  var body: some Scene {
    WindowGroup {
      FeedView(viewModel: FeedView.Model())
        .preferredColorScheme(.dark)
    }
  }
}
