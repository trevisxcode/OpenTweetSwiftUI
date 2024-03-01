//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct FeedView: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          TweetView()
          TweetView()
          TweetView()
          TweetView()
        }
      }
      .navigationTitle("OpenX")
    }
  }
}

#Preview {
  FeedView()
}
