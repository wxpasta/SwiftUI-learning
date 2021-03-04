//
//  CourseSectionDetail.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/1/20.
//

import SwiftUI

struct CourseSectionDetail: View {
    var section: CourseSection = courseSections[1]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            #if os(iOS)
            content
                .navigationTitle(section.title)
                .navigationBarTitleDisplayMode(.inline)
            #else
            content
                .frame(maxWidth: 800, maxHeight: 600)
            #endif
            
            CloseButton()
                .padding(20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(section.logo)
                        .renderingMode(.original)
                        .padding(.all, 3)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                        .padding(.all, 1)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(section.title)
                        .font(.title3).bold()
                        .foregroundColor(.white)
                    Text(section.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
            }
            .padding(.all, 20)
            .background(
                Image("Livestream 1")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            
            CourseSectionContent()
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionDetail()
    }
}
