//
//  AnywhereCountApp.swift
//  AnywhereCount
//
//  Created by hara ryuto   on 2026/06/11.
//

import SwiftUI

@main
struct AnywhereCountApp: App {
  /// アプリのフォアグラウンド・バックグラウンド状態
  @Environment(\.scenePhase) private var scenePhase

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .onChange(of: scenePhase) { _, newPhase in
      switch newPhase {
      case .background:
        // バックグラウンド移行時にLive Activityを自動開始する
        LiveActivityManager.shared.start(count: CounterStore.count)
      case .active:
        // フォアグラウンド復帰時はLive Activityを終了する
        LiveActivityManager.shared.endAll()
      default:
        break
      }
    }
  }
}
