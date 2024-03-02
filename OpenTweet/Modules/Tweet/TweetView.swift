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
          HStack(spacing: 4) {
            Text(viewModel.profileName)
              .layoutPriority(1)
              .lineLimit(1)
              .font(.callout)
              .bold()
              .foregroundColor(.white)
            
            Group {
              Text(viewModel.username)
                .truncationMode(.tail)
              Text("·")
              Text(viewModel.date)
                .layoutPriority(1)
            }
            .lineLimit(1)
            .font(.callout)
            .foregroundColor(.gray)
            
            Spacer()
          }
          HStack(spacing: .zero) {
            Text(viewModel.content)
              .multilineTextAlignment(.leading)
              .font(.callout)
              .foregroundColor(.white)
            Spacer()
          }
          Spacer()
        }
      }
      .padding([.leading, .trailing], 12)
      .padding([.top, .bottom], 4)
      
      Rectangle()
        .fill(Color.gray)
        .frame(height: 1)
    }
  }
}

#Preview {
  TweetView(viewModel: .default)
}
