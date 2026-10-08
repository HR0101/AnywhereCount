//
//  AnywhereCountWidgetBundle.swift
//  AnywhereCountWidget
//
//  Widget拡張のエントリーポイント
//

import SwiftUI
import WidgetKit

/// Widget拡張のバンドル定義
@main
struct AnywhereCountWidgetBundle: WidgetBundle {
  var body: some Widget {
    CounterLiveActivity()
  }
}
