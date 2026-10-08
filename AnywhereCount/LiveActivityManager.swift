//
//  LiveActivityManager.swift
//  AnywhereCount
//
//  Live Activityの開始・更新・終了を管理する
//

import ActivityKit
import Foundation

/// カウンターLive Activityのライフサイクルを管理するクラス
@MainActor
final class LiveActivityManager {
  static let shared = LiveActivityManager()

  private init() {}

  /// Live Activityを開始する（既存があれば更新のみ行う）
  func start(count: Int) {
    // Live Activityが許可されていない場合は何もしない
    guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }

    let content = ActivityContent(
      state: CounterAttributes.ContentState(count: count),
      staleDate: nil
    )

    // 既存のLive Activityがあれば更新して終了
    if let activity = Activity<CounterAttributes>.activities.first {
      Task {
        await activity.update(content)
      }
      return
    }

    // 新規にLive Activityを開始する
    do {
      _ = try Activity.request(
        attributes: CounterAttributes(),
        content: content
      )
    } catch {
      // 開始に失敗してもアプリ本体の動作には影響させない
      print("Live Activityの開始に失敗しました: \(error)")
    }
  }

  /// すべてのLive Activityを終了する
  func endAll() {
    Task {
      for activity in Activity<CounterAttributes>.activities {
        await activity.end(nil, dismissalPolicy: .immediate)
      }
    }
  }
}
