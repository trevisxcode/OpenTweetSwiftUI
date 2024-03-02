//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct FeedView: View {
  @StateObject var viewModel: FeedView.Model
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          ForEach(viewModel.tweets, id: \.self) { tweet in
            NavigationLink {
              TweetDetailView(viewModel: viewModel.tweetDetailViewModel(for: tweet))
            } label: {
              TweetView(viewModel: viewModel.tweetViewModel(for: tweet))
            }
            .buttonStyle(ScaledButtonStyle())
          }
        }
      }
      .navigationTitle(viewModel.navigationTitle)
      .task {
        viewModel.fetchTweet()
      }
    }
  }
}

#Preview {
  FeedView(viewModel: FeedView.Model())
}
