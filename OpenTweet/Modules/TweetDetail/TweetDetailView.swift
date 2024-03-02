//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import SwiftUI

struct TweetDetailView: View {
  @StateObject var viewModel: TweetDetailView.Model
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          headerView
          ForEach(viewModel.replyTweets, id: \.self) { tweet in
            NavigationLink {
              TweetDetailView(viewModel: viewModel.tweetDetailViewModel(for: tweet))
            } label: {
              TweetView(viewModel: viewModel.tweetViewModel(for: tweet))
            }
          }
        }
      }
      .navigationTitle("Post")
      .navigationBarTitleDisplayMode(.inline)
      .task {
        viewModel.fetchReplyTweets()
      }
    }
  }
  
  private var headerView: some View {
    VStack {
      VStack {
        HStack {
          AsyncImageView(imageUrl: viewModel.avatar)
            .frame(width: 44, height: 44)
            .clipShape(Circle())
          VStack {
            Text(viewModel.profileName)
              .foregroundColor(.white)
              .bold()
            
            Text(viewModel.username)
              .foregroundColor(.gray)
          }
          Spacer()
        }
        HStack {
          Text(viewModel.content)
            .padding([.top, .bottom], 4)
          Spacer()
        }
        
        HStack {
          Text(viewModel.date)
            .foregroundColor(.gray)
            .font(.callout)
          Spacer()
        }
      }.padding([.top, .leading, .leading])
      
      Rectangle()
        .fill(Color.gray)
        .frame(height: 1)
    }
  }
}

#Preview {
  TweetDetailView(viewModel: .default)
}
