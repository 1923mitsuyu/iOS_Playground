//
//  SwiftUIView.swift
//  PlaygroundCore
//
//  Created by Ikufumi Mitsuyu on 2026/06/15.
//

import SwiftUI

package struct ExpandableScrollView: View {
  @State private var offset: CGFloat = 0
  package init() {}
  package var body: some View {
    ZStack(alignment: .top) {
      Group {
        Color.blue
        Text("このテキストの上をScrollViewが通過します。")
      }
      .scaleEffect(
        1 + max(0, -offset) / 300,
        anchor: .bottom
      )
      ScrollView {
        Color.clear
          .frame(height: 300)
        VStack(spacing: 16) {
          ForEach(0..<100) { index in
            Text("Item \(index)")
              .frame(maxWidth: .infinity)
              .padding()
          }
        }
        .scrollBounceBehavior(.basedOnSize)
        .background(.red)
        .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
      }
      .onScrollGeometryChange(
        for: CGFloat.self,
        of: { geometry in
          geometry.contentOffset.y
        },
        action: { _, newValue in
          offset = newValue
        }
      )
    }
    .ignoresSafeArea(edges: .top)
  }
}

#Preview {
  ExpandableScrollView()
}
