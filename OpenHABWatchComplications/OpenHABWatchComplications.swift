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

import SwiftUI
import WidgetKit

// MARK: - Timeline Provider

struct OpenHABWatchComplicationsProvider: TimelineProvider {
    func placeholder(in context: Context) -> OpenHABWatchComplicationsEntry {
        OpenHABWatchComplicationsEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (OpenHABWatchComplicationsEntry) -> Void) {
        let entry = OpenHABWatchComplicationsEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<OpenHABWatchComplicationsEntry>) -> Void) {
        let entry = OpenHABWatchComplicationsEntry(date: Date())
        // Static timeline since this is just an app launcher
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct OpenHABWatchComplicationsEntry: TimelineEntry {
    let date: Date
}

// MARK: - Complication View

struct OpenHABComplicationEntryView: View {
    var entry: OpenHABWatchComplicationsEntry
    @Environment(\.widgetFamily) var family

    var body: some View {
        ZStack {
            switch family {
            case .accessoryCircular:
                AccessoryWidgetBackground()
                Image("OHComplicationIcon")
                    .resizable()
                    .scaledToFit()
                    .padding(5)

            case .accessoryCorner:
                AccessoryWidgetBackground()
                Image("OHComplicationCorner")
                    .resizable()
                    .scaledToFit()
                    .padding(4)

            default:
                EmptyView()
            }
        }
        .widgetAccentable()
        .widgetURL(URL(string: "openhab://launch"))
    }
}

// MARK: - Widget Declaration

struct OpenHABWatchComplications: Widget {
    let kind = "OpenHABWatchComplications"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: OpenHABWatchComplicationsProvider()) { entry in
            OpenHABComplicationEntryView(entry: entry)
        }
        .configurationDisplayName("openHAB")
//        .description("Example text for the Widget")
        .supportedFamilies([
            .accessoryCircular,
            .accessoryCorner
//            .accessoryRectangular
//            .accessoryInline
        ])
    }
}

// MARK: - Previews

#Preview("Circular", as: .accessoryCircular) {
    OpenHABWatchComplications()
} timeline: {
    OpenHABWatchComplicationsEntry(date: Date())
}

#Preview("Corner", as: .accessoryCorner) {
    OpenHABWatchComplications()
} timeline: {
    OpenHABWatchComplicationsEntry(date: Date())
}
