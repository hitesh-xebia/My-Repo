//
//  MySwiftUIWidgetLiveActivity.swift
//  MySwiftUIWidget
//
//  Created by Hitesh.Chouhan on 28/07/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MySwiftUIWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MySwiftUIWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MySwiftUIWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MySwiftUIWidgetAttributes {
    fileprivate static var preview: MySwiftUIWidgetAttributes {
        MySwiftUIWidgetAttributes(name: "World")
    }
}

extension MySwiftUIWidgetAttributes.ContentState {
    fileprivate static var smiley: MySwiftUIWidgetAttributes.ContentState {
        MySwiftUIWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MySwiftUIWidgetAttributes.ContentState {
         MySwiftUIWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MySwiftUIWidgetAttributes.preview) {
   MySwiftUIWidgetLiveActivity()
} contentStates: {
    MySwiftUIWidgetAttributes.ContentState.smiley
    MySwiftUIWidgetAttributes.ContentState.starEyes
}
