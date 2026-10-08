//
//  ContentView.swift
//  AnywhereCount
//
//  Created by hara ryuto   on 2026/06/11.
//

import SwiftUI

struct ContentView: View {
  /// App Group共有のUserDefaultsに保存されるカウント
  @AppStorage(CounterStore.countKey, store: CounterStore.sharedDefaults)
  private var count = 0

  @State private var showResetAlert = false

  var body: some View {
    VStack(spacing: 16) {
      Spacer()

      // 中央に大きくカウントを表示する
      Text("\(count)")
        .font(.system(size: 140, weight: .bold, design: .rounded))
        .monospacedDigit()
        .minimumScaleFactor(0.4)
        .lineLimit(1)
        .contentTransition(.numericText())
        .padding(.horizontal)

      Spacer()

      Text("画面をタップでカウント")
        .font(.subheadline)
        .foregroundStyle(.secondary)

      Button("リセット") {
        showResetAlert = true
      }
      .font(.subheadline)
      .foregroundStyle(.secondary)
      .padding(.bottom, 24)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .contentShape(Rectangle())
    .onTapGesture {
      // 画面のどこをタップしてもカウントを1増やす
      withAnimation(.snappy) {
        count += 1
      }
    }
    .sensoryFeedback(.increase, trigger: count)
    .alert("リセットしますか？", isPresented: $showResetAlert) {
      Button("リセット", role: .destructive) {
        withAnimation(.snappy) {
          count = 0
        }
      }
      Button("キャンセル", role: .cancel) {}
    }
  }
}

#Preview {
  ContentView()
}
