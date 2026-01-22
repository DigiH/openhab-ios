// Copyright (c) 2010-2026 Contributors to the openHAB project
//
// See the NOTICE file(s) distributed with this work for additional
// information.
//
// This program and the accompanying materials are made available under the
// terms of the Eclipse Public License 2.0 which is available at
// http://www.eclipse.org/legal/epl-2.0
//
// SPDX-License-Identifier: EPL-2.0

import AppIntents
import SwiftUI
import WidgetKit

// struct OpenHABWatchComplicationsControl: ControlWidget {
//    var body: some ControlWidgetConfiguration {
//        StaticControlConfiguration(
//            kind: "org.openhab.app.watchkitapp.OpenHABWatchComplications",
//            provider: Provider()
//        ) { value in
//            ControlWidgetToggle(
//                "Start Timer",
//                isOn: value,
//                action: StartTimerIntent()
//            ) { isRunning in
//                Label(isRunning ? "On" : "Off", systemImage: "timer")
//            }
//        }
//        .displayName("Timer")
//        .description("A an example control that runs a timer.")
//    }
// }
//
// extension OpenHABWatchComplicationsControl {
//    struct Provider: ControlValueProvider {
//        var previewValue: Bool {
//            false
//        }
//
//        func currentValue() async throws -> Bool {
//            let isRunning = true // Check if the timer is running
//            return isRunning
//        }
//    }
// }
//
// struct StartTimerIntent: SetValueIntent {
//    static let title: LocalizedStringResource = "Start a timer"
//
//    @Parameter(title: "Timer is running")
//    var value: Bool
//
//    func perform() async throws -> some IntentResult {
//        // Start / stop the timer based on `value`.
//        .result()
//    }
// }
