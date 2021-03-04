//
//  TutorialPages.swift
//  iOS
//
//  Created by Meng To on 7/8/20.
//

import SwiftUI

struct TutorialPages: View {
    @State var selection = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                VStack {
                    ForEach(tutorialSections.indices) { index in
                        if index <= 3 {
                            NavigationLink(destination: TutorialSectionDetail(section: tutorialSections[index])) {
                                TutorialSectionRow(section: tutorialSections[index])
                                    .padding(.all, 8)
                                    .frame(maxHeight: 78)
                            }
                        }
                    }
                }
                .frame(width: 300, height: 350)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .tag(1)
                
                VStack {
                    ForEach(courseSections.indices) { index in
                        if index > 3 && index <= 7  {
                            NavigationLink(destination: TutorialSectionDetail(section: tutorialSections[index])) {
                                TutorialSectionRow(section: tutorialSections[index])
                                    .padding(.all, 8)
                                    .frame(maxHeight: 78)
                            }
                        }
                    }
                }
                .frame(width: 300, height: 350)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .tag(2)
            }
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(width: 400, height: 400)
        .background(Color("Background 1"))
    }
}

struct TutorialPages_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPages()
    }
}
