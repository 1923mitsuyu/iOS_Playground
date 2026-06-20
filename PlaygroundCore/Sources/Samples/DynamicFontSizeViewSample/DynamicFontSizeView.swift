//
//  DynamicFontSizeView.swift
//  PlaygroundCore
//
//  Created by Ikufumi Mitsuyu on 2026/06/20.
//

import SwiftUI

package struct DynamicFontSizeView: View {
  // MARK: - Properties
  @State private var text: String = "私はイケメン。"
  @State private var fontSize: CGFloat = 30.0
  // MARK: - Initialize
  package init() {}
  // MARK: - Body
  package var body: some View {
    /// @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)
    VStack(spacing: 0) {
      /// @inlinable public init(minLength: CGFloat? = nil)
      Spacer()
      /// public init<S>(_ content: S) where S : StringProtocol
      Text(text)
        .font(.system(size: fontSize))
        .lineLimit(1)
      /// 0.5倍のサイズまで縮小され、それより小さい場合は ...で省略される
        .minimumScaleFactor(0.5)
        .frame(maxWidth: .infinity)
        .padding(20)
      Spacer()
      /// @preconcurrency public init(action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label)
      Button {
        text += "イケメン!"
      } label: {
        Text("+")
      }
      /// nonisolated public func buttonStyle<S>(_ style: S) -> some View where S : ButtonStyle
      .buttonStyle(BlueRoundedButtonStyle())
    }
    .ignoresSafeArea()
  }
}

struct BlueRoundedButtonStyle: ButtonStyle {
    /// @ViewBuilder @MainActor @preconcurrency func makeBody(configuration: Self.Configuration) -> Self.Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .font(.system(size: 30))
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 25))
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .padding(.horizontal, 100)
            .padding(.bottom, 50)
    }
}

#Preview {
  DynamicFontSizeView()
}
