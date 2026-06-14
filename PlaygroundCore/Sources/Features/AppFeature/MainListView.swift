//
//  MainListView.swift
//  iOS_Playground
//
//  Created by Ikufumi Mitsuyu on 2026/06/14.
//

import SwiftUI

public struct MainListView: View {
  public init() {}
  public var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  MainListView()
}
