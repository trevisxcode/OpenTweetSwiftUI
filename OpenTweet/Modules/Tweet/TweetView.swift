//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct TweetView: View {
  
  @StateObject var viewModel: TweetView.Model
  
  var body: some View {
    VStack(spacing: .zero) {
      HStack {
        VStack {
          AsyncImageView(imageUrl: viewModel.avatar)
            .frame(width: 44, height: 44)
            .clipShape(Circle())
          Spacer()
        }
        VStack {
          authorView
          contentView
          Spacer()
        }
      }
      .padding([.leading, .trailing], 12)
      .padding([.top, .bottom], 4)
      
      divider
    }
  }
  
  private var authorView: some View {
    HStack(spacing: 4) {
      Text(viewModel.profileName)
        .layoutPriority(1)
        .bold()
        .foregroundColor(.white)
      
      Group {
        Text(viewModel.username)
          .truncationMode(.tail)
        Text("·")
        Text(viewModel.date)
          .layoutPriority(1)
      }
      .foregroundColor(.gray)
      
      Spacer()
    }
    .lineLimit(1)
    .font(.callout)
  }
  
  private var contentView: some View {
    HStack(spacing: .zero) {
      TweetContentText(viewModel: viewModel.tweetContentTextModel)
        .multilineTextAlignment(.leading)
        .font(.callout)
        .foregroundColor(.white)
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
  TweetView(viewModel: .default)
}
