//
//  MainListView.swift
//  iOS_Playground
//
//  Created by Ikufumi Mitsuyu on 2026/06/14.
//

import ExpandableScrollViewSample
import DynamicFontSizeViewSample
import SwiftUI

public struct MainListView: View {
  public init() {}
  public var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(Destinations.Main.allCases, id: \.self) { destination in
            NavigationLink(value: destination) {
              Text(destination.rawValue)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
          }
        }
        .padding()
      }
      .navigationTitle("UI Playground")
      .navigationBarTitleDisplayMode(.inline)
      .navigationDestination(for: Destinations.Main.self) { destination in
        switch destination {
        case .expandableScrollView:
          ExpandableScrollView()
        }
      }
    }
  }
}

#Preview {
  MainListView()
}
