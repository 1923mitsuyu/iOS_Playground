//
//  SwiftUIView.swift
//  PlaygroundCore
//
//  Created by Ikufumi Mitsuyu on 2026/06/15.
//

// TODO
// maxItemCountsの数が少ない場合は、Spacerで埋める
// Contentの高さ < ScrollViewの高さの場合は Scrollを Disableにする

import SwiftUI

package struct ExpandableScrollView: View {
  // MARK: - Properties
  @State private var scale: CGFloat = 0
  
  private let maxItemCounts = 20
  // MARK: - Initialize
  package init() {}
  // MARK: - Body
  package var body: some View {
    ZStack(alignment: .top) {
      Group {
        Color.white
        VStack(spacing: 24) {
          Text("ScrollViewが重なります。")
          Text("Scroll Downすると、Viewが拡大します。")
        }
        .padding(.top, 100)
      }
      .scaleEffect(scale, anchor: .bottom)
      ScrollView {
        Color.clear
          .frame(height: 300)
        VStack(spacing: 20) {
          /// ForEachにidがない場合は、Non-constant range: argument must be an integer literalエラーが発生
          /// https://blog.hikaru.run/2022/06/07/swiftui-foreach-warning.html
          ForEach(0..<maxItemCounts, id: \.self) { index in
            Text("Item \(index)")
              .frame(maxWidth: .infinity)
              .frame(height: 60)
              .background(.white)
              .clipShape(.rect(cornerRadius: 30))
              .padding(.horizontal, 60)
          }
        }
        .padding(.top, 20)
        .padding(.bottom, 48)
        .background(.gray)
        .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
      }
      .onScrollGeometryChange(
        for: CGFloat.self,
        of: { geometry in
          geometry.contentOffset.y
        },
        action: { _, offset in
          scale =  1 + max(0, -offset) / 600
        }
      )
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ExpandableScrollView()
}

