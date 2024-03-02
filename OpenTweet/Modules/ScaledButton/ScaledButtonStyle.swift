//  Created by Taeshawit (Trevis) Suwanwigo on 3/2/24.

import SwiftUI

struct ScaledButtonStyle: ButtonStyle {
  struct Constant {
    static var pressedScale = 0.95
    static var idleScale = 1.00
  }

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(
        configuration.isPressed ? Constant.pressedScale : Constant.idleScale
      )
      .animation(.easeInOut, value: configuration.isPressed)
  }
}
