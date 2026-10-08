//
//  CounterLiveActivity.swift
//  AnywhereCountWidget
//
//  Dynamic Island・ロック画面に表示するLive ActivityのUI定義
//

import ActivityKit
import AppIntents
import SwiftUI
import WidgetKit

/// カウンターのLive Activity
struct CounterLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: CounterAttributes.self) { context in
      // ロック画面・通知バナーに表示されるUI
      LockScreenCounterView(count: context.state.count)
    } dynamicIsland: { context in
      DynamicIsland {
        // 長押しで展開したときのUI
        DynamicIslandExpandedRegion(.leading) {
          Image(systemName: "number.circle.fill")
            .font(.title2)
            .foregroundStyle(.cyan)
            .frame(maxHeight: .infinity)
        }
        DynamicIslandExpandedRegion(.center) {
          Text("\(context.state.count)")
            .font(.system(size: 44, weight: .bold, design: .rounded))
            .monospacedDigit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .contentTransition(.numericText())
        }
        DynamicIslandExpandedRegion(.trailing) {
          IncrementButton()
            .frame(maxHeight: .infinity)
        }
      } compactLeading: {
        Image(systemName: "number.circle.fill")
          .foregroundStyle(.cyan)
      } compactTrailing: {
        Text("\(context.state.count)")
          .monospacedDigit()
          .foregroundStyle(.cyan)
          .contentTransition(.numericText())
      } minimal: {
        Text("\(context.state.count)")
          .monospacedDigit()
          .foregroundStyle(.cyan)
          .minimumScaleFactor(0.6)
          .lineLimit(1)
          .contentTransition(.numericText())
      }
    }
  }
}

/// ロック画面用のカウンター表示ビュー
struct LockScreenCounterView: View {
  /// 表示するカウント数
  let count: Int

  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text("AnywhereCount")
          .font(.caption)
          .foregroundStyle(.secondary)
        Text("\(count)")
          .font(.system(size: 44, weight: .bold, design: .rounded))
          .monospacedDigit()
          .minimumScaleFactor(0.5)
          .lineLimit(1)
          .contentTransition(.numericText())
      }
      Spacer()
      IncrementButton()
    }
    .padding()
  }
}

/// カウントを1増やす「＋」ボタン（アプリを開かずにApp Intentを実行する）
struct IncrementButton: View {
  var body: some View {
    Button(intent: IncrementCountIntent()) {
      Image(systemName: "plus")
        .font(.title3.bold())
        .frame(width: 44, height: 44)
    }
    .buttonStyle(.bordered)
    .buttonBorderShape(.circle)
    .tint(.cyan)
  }
}

#Preview("ロック画面", as: .content, using: CounterAttributes()) {
  CounterLiveActivity()
} contentStates: {
  CounterAttributes.ContentState(count: 0)
  CounterAttributes.ContentState(count: 42)
}
