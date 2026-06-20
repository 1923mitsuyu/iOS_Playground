//
//  SwiftUIView.swift
//  PlaygroundCore
//
//  Created by Ikufumi Mitsuyu on 2026/06/20.
//

import ComposableArchitecture
import CoreLocation
import SwiftUI

/// 現在地を取得する
/// フラーオフィスの位置を取得する
/// 差を計算する

@Reducer
package struct DistanceCalculation {
  // MARK: - State
  @ObservableState
  package struct State: Equatable {
    package init() {}
  }

  // MARK: - Action
  package enum Action: ViewAction {
    case view(View)
    
    @CasePathable
    package enum View {
      case onAppear
    }
  }
  
  // MARK: - Body
  package var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case let .view(action):
        return view(action, state: &state)
      }
    }
  }
}

private extension DistanceCalculation {
  func view(_ action: Action.View, state: inout State) -> Effect<Action> {
    switch action {
    case .onAppear:
      return .none
    }
  }
}
package struct DistanceCalculationView: View {
  // MARK: - Properties
  private let locationManger = CLLocationManager()
  // MARK: - Initialize
  package init() {}
  // MARK: - Body
  package var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  DistanceCalculationView()
}
