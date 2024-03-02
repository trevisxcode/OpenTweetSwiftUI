//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import SwiftUI

struct ScaledButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
      .animation(.easeInOut, value: configuration.isPressed)
  }
}
