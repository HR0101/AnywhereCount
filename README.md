# AnywhereCount

どこからでも素早くカウントできる、iOS向けインタラクティブ・カウンターアプリ。  
Dynamic Island、ロック画面の Live Activities、ホーム画面ウィジェットから直接カウント操作を行えます。

---

## ✨ 主な機能

- **メイン画面でのカウンター管理**
  - タップによるカウントのインクリメント／デクリメント
  - リセット機能と現在のカウント状態の永続化
- **Live Activities & Dynamic Island 対応 (ActivityKit)**
  - アプリを閉じていてもロック画面や Dynamic Island 上にリアルタイムでカウントを表示
  - バックグラウンドでも進行状況を一目で把握可能
- **インタラクティブ・ウィジェット (WidgetKit & App Intents)**
  - ホーム画面やロック画面のウィジェットから直接カウントアップ（iOS 17+）
  - アプリを開く手間なくワンタップで記録完了
- **データ共有 (App Group)**
  - アプリ本体とウィジェット / Live Activity 拡張機能間でデータを同期

---

## 🛠 技術構成

- **プラットフォーム**: iOS 16.1+ (Interactive Widgetsは iOS 17+)
- **言語**: Swift
- **UIフレームワーク**: SwiftUI
- **システム連携**:
  - `ActivityKit` (Live Activities & Dynamic Island)
  - `WidgetKit` (ホーム／ロック画面ウィジェット)
  - `AppIntents` (ウィジェットからの直接アクション実行)
  - `UserDefaults (App Groups)` (データ同期)

---

## 📂 プロジェクト構成

```
AnywhereCount/
├── AnywhereCount/             # メインアプリターゲット
│   ├── AnywhereCountApp.swift
│   ├── ContentView.swift      # メインカウンターUI
│   └── LiveActivityManager.swift
├── AnywhereCountWidget/       # Widget / Live Activity ターゲット
│   ├── AnywhereCountWidgetBundle.swift
│   └── CounterLiveActivity.swift
├── Shared/                    # アプリ・拡張間で共有するモデル / Intent
│   ├── CounterAttributes.swift
│   ├── CounterStore.swift
│   └── IncrementCountIntent.swift
└── AnywhereCount.xcodeproj
```

---

## 🚀 使い方

1. Xcode で `AnywhereCount.xcodeproj` を開きます。
2. Signing & Capabilities でご自身の Apple Developer チームを設定します。
3. App Groups の識別子を設定（必要に応じて有効化）。
4. 実機またはシミュレータを選択してビルド＆実行します。
