//
//  SearchView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/1/20.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var show = false
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content.listStyle(InsetGroupedListStyle())
        #else
        content
        #endif
    }
    
    var content: some View {
        List {
            TextField("Search", text: $searchText)
                .font(.title3)
                .padding(8)
                .background(Color("Background 2"))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.vertical, 8)
            
            ForEach(courseSections){ section in
                if section.title.localizedCaseInsensitiveContains(searchText) || section.subtitle.localizedCaseInsensitiveContains(searchText) || searchText == "" {
                    
                    CourseRow(section: section)
                        .padding(.vertical, 4)
                        .sheet(isPresented: $show) {
                            CourseSectionDetail()
                        }
                        .onTapGesture {
                            show.toggle()
                        }
                }
            }
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
