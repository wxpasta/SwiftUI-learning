//
//  CourseSectionContent.swift
//  iOS
//
//  Created by Meng To on 6/29/20.
//

import SwiftUI

struct CourseSectionContent: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(contentText) { item in
                    Text(item.text).font(item.font).fontWeight(item.weight)
                }
            }
            .padding(16)
            CourseContent()
        }
    }
}

struct Content: Identifiable {
    var id = UUID()
    var text: String
    var font: Font
    var weight: Font.Weight
}

var contentText = [
    Content(text: "SwiftUI is hands-down the best way for designers to take a first step into code. Thanks to its live Preview, you can iterate quickly and create powerful user interfaces with a few lines of code that works for all of Apple's platforms. Take your static design to the next level and build real apps with the simplicity of a prototyping tool.", font: .body, weight: .regular),
    Content(text: "This Course", font: .title, weight: .bold),
    Content(text: "This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.", font: .body, weight: .regular),
    Content(text: "SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.", font: .body, weight: .regular),
    Content(text: "Requirements", font: .title, weight: .bold),
    Content(text: "Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.", font: .body, weight: .regular),
    Content(text: "States and Animations", font: .title, weight: .bold),
    Content(text: "Transitions are like Magic Move in Keynote. You only need to set the states and SwiftUI will figure out for you the transition between the two states.", font: .body, weight: .regular),
    Content(text: "Animations", font: .title, weight: .bold),
    Content(text: "SwiftUI provides a number of ways to animate your transitions. They even have their own physics-based built-in functions that allows you to use overshoot and apply bounciness to your animations.", font: .body, weight: .regular),
    Content(text: "Stacks", font: .title, weight: .bold),
    Content(text: "If you're new to stacks in SwiftUI, I suggest using Spacer a lot. By default, views take min size of child elements. This is an image I made to help you understand.", font: .body, weight: .regular),
    Content(text: "SwiftUI for All Devices", font: .title, weight: .bold),
    Content(text: "SwiftUI works for iPad, Mac, Apple TV and Watch. There are minimal code changes and you can reuse a lot of the same components. The Stacks, Controls and Layout system will work the same, with a few adjustments. The philosophy for SwiftUI is not to write once, apply everywhere, but to learn once, apply anywhere.", font: .body, weight: .regular),
    Content(text: "For example, modals are automatically contextual giving you the dismiss gesture and sizing them properly for you. Most controls and data work across all platforms, with some minor layout changes and navigation. Those controls will be automatically translated for you, using the appropriate UI for their specific platform. For example, a Picker will look like a List in iOS, but it'll look like a drop-down for Mac.", font: .body, weight: .regular),
]

struct SectionContent_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionContent()
    }
}
