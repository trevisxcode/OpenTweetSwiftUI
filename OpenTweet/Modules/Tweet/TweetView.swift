//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct TweetView: View {
  
  @StateObject var viewModel: TweetView.Model
  
  var body: some View {
    VStack(spacing: .zero) {
      HStack {
        VStack {
          Image(systemName: "person.fill")
            .frame(width: 44, height: 44)
            .foregroundColor(.black)
            .background(Color.white)
            .clipShape(Circle())
          Spacer()
        }
        VStack {
          HStack {
            Text(viewModel.profileName)
              .bold()
            
            Group {
              Text(viewModel.username)
              Text("·")
              Text(viewModel.date)
            }
            .font(.callout)
            .foregroundColor(.gray)
            
            Spacer()
          }
          HStack(spacing: .zero) {
            Text(viewModel.content)
              .multilineTextAlignment(.leading)
              .font(.callout)
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
