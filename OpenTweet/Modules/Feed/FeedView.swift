//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct FeedView: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          TweetView(viewModel: .default)
          TweetView(viewModel: .default)
          TweetView(viewModel: .default)
          TweetView(viewModel: .default)
        }
      }
      .navigationTitle("OpenX")
    }
  }
}

#Preview {
  FeedView()
}
