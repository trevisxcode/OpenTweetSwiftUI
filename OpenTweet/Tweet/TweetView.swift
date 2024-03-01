//  Created by Taeshawit (Trevis) Suwanwigo on 2/29/24.

import SwiftUI

struct TweetView: View {
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
            Text("OpenTweet")
              .bold()
            Spacer()
          }
          HStack(spacing: .zero) {
            Text("Hi! Welcome to your iOS coding excercise. This is a very simple twitter like client. You'll find a json file under Data/ with a short tweet timeline. You are asked to write the app that will display the tweets, similar to what a Twitter client would do.")
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
  TweetView()
}
