//
//  CourseItem.swift
//  macOS
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct CourseItem: View {
    var course: Course = courses[0]
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                Spacer()
                Image(course.image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200)
                Spacer()
            }
            Text(course.title)
                .bold()
                .foregroundColor(.white)
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(Color.white.opacity(0.7))
        }
        .padding(16)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
