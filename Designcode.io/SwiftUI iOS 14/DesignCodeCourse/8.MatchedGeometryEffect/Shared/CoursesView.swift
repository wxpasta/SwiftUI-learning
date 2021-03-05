//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Meng To on 2020-07-15.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            CourseItem()
                .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                .frame(width: 335, height: 250)
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .frame(height: 300)
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .transition(.opacity)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
