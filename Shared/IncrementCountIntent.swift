//
//  IncrementCountIntent.swift
//  AnywhereCount
//
//  Live Activity上の「＋」ボタンからカウントを1増やすIntent
//

import ActivityKit
import AppIntents

/// アプリを開かずにカウントを1増やすIntent（Live Activityのボタンから実行される）
struct IncrementCountIntent: LiveActivityIntent {
  static var title: LocalizedStringResource = "カウントを増やす"
  static var description = IntentDescription("カウントを1増やします")

  @MainActor
  func perform() async throws -> some IntentResult {
    // カウントを1増やして保存する
    let newCount = CounterStore.count + 1
    CounterStore.count = newCount

    // 表示中のLive Activityをすべて新しいカウントに更新する
    let newState = CounterAttributes.ContentState(count: newCount)
    for activity in Activity<CounterAttributes>.activities {
      await activity.update(ActivityContent(state: newState, staleDate: nil))
    }
    return .result()
  }
}
