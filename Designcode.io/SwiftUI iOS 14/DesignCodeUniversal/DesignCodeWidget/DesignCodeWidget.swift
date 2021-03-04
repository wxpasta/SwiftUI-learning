//
//  DesignCodeWidget.swift
//  DesignCodeWidget
//
//  Created by Meng To on 7/1/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct DesignCodeWidgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily

    var body: some View {
        DesignCodeWidgetView()
    }
}

@main
struct DesignCodeWidget: Widget {
    private let kind: String = "DesignCodeWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DesignCodeWidgetEntryView()
        }
        .configurationDisplayName("DesignCode")
        .description("Latest courses and tutorials")
    }
}

struct DesignCodeWidgetView: View {
    var items = courseSections
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent".uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            ForEach(0 ..< 4) { index in
                Divider()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(items[index].title)
                            .font(.subheadline).bold()
                        Text(items[index].subtitle)
                            .font(.footnote).foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(items[index].logo)
                        .frame(width: 48, height: 48)
                        .background(ContainerRelativeShape().fill(items[index].color))
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct DesignCodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        DesignCodeWidgetView()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
