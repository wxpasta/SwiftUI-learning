//
//  CoursesView.swift
//  macOS
//
//  Created by Meng To on 7/8/20.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    
    var body: some View {
        ScrollView {
            content
            SectionTitle(title: "Recent sections")
            CourseContent()
        }
        .frame(minWidth: 500, idealWidth: 700, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        .navigationTitle("Courses")
    }
    var content: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 12) {
            ForEach(courses) { course in
                CourseItem(course: course)
                    .frame(maxWidth: 200)
                    .sheet(isPresented: $show) {
                        CourseDetail()
                    }
                    .onTapGesture {
                        show.toggle()
                    }
            }
        }
        .padding()
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
