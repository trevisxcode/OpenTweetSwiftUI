//  Created by Taeshawit (Trevis) Suwanwigo on 3/1/24.

import SwiftUI

struct TweetDetailView: View {
  @StateObject var viewModel: TweetDetailView.Model
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          tweetDetailView
          replyTweetsView
        }
      }
      .navigationTitle(viewModel.navigationTitle)
      .navigationBarTitleDisplayMode(.inline)
      .task {
        viewModel.fetchReplyTweets()
      }
    }
  }
  
  private var tweetDetailView: some View {
    VStack {
      VStack {
        authorView
        contentView
        dateView
      }.padding([.top, .leading, .leading])
      
      divider
    }
  }
  
  private var replyTweetsView: some View {
    ForEach(viewModel.replyTweets, id: \.self) { tweet in
      NavigationLink {
        TweetDetailView(viewModel: viewModel.tweetDetailViewModel(for: tweet))
      } label: {
        TweetView(viewModel: viewModel.tweetViewModel(for: tweet))
      }
      .buttonStyle(ScaledButtonStyle())
    }
  }
  
  private var authorView: some View {
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
  }
  
  private var contentView: some View {
    HStack {
      TweetContentText(viewModel: viewModel.tweetContentTextModel)
        .padding([.top, .bottom], 4)
      Spacer()
    }
  }
  
  private var dateView: some View {
    HStack {
      Text(viewModel.date)
        .foregroundColor(.gray)
        .font(.callout)
      Spacer()
    }
  }
  
  private var divider: some View {
    Rectangle()
      .fill(Color.gray)
      .frame(height: 1)
  }
}

#Preview {
  TweetDetailView(viewModel: .default)
}
