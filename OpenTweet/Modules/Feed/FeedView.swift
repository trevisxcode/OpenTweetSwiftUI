//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct FeedView: View {
  @StateObject var viewModel: FeedView.Model
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          ForEach(viewModel.tweetViewModels, id: \.self) { viewModel in
            TweetView(viewModel: viewModel)
          }
        }
      }
      .navigationTitle("OpenX")
      .task {
        viewModel.fetchTweet()
      }
    }
  }
}

#Preview {
  FeedView(viewModel: FeedView.Model())
}
