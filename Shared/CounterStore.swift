//
//  CounterStore.swift
//  AnywhereCount
//
//  メインアプリとWidget拡張間でカウントを共有するためのストア
//

import Foundation

/// App Group経由でカウントを読み書きするためのストア
enum CounterStore {
  /// App GroupのID（メインアプリとWidget拡張で共通）
  static let appGroupID = "group.com.HR.AnywhereCount"

  /// カウント保存用のキー
  static let countKey = "count"

  /// App Groupで共有されるUserDefaults
  static var sharedDefaults: UserDefaults {
    // App Groupが利用できない場合はstandardにフォールバックする
    UserDefaults(suiteName: appGroupID) ?? .standard
  }

  /// 現在のカウント
  static var count: Int {
    get { sharedDefaults.integer(forKey: countKey) }
    set { sharedDefaults.set(newValue, forKey: countKey) }
  }
}
