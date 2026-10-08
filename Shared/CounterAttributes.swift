//
//  CounterAttributes.swift
//  AnywhereCount
//
//  カウンター用Live Activityの属性定義
//

import ActivityKit

/// カウンターLive Activityの属性
struct CounterAttributes: ActivityAttributes {
  /// Live Activity表示中に更新される状態
  struct ContentState: Codable, Hashable {
    /// 現在のカウント数
    var count: Int
  }
}
