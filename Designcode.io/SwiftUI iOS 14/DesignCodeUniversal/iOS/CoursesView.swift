//
//  CoursesView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 6/29/20.
//

import SwiftUI

struct CoursesView: View {
    @Namespace var namespace
    @State var items = courses
    @State var show =  false
    @State var showNavBar = true
    @State var selection: Set<NavigationItem> = [.courses]
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            if horizontalSizeClass == .compact {
                tabView
            } else {
                sidebar
            }
            fullContent
        }
    }
    
    var content: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 159), spacing: 16)],
                spacing: 16) {
                ForEach(items.indices) { index in
                    VStack {
                        CourseItem(course: items[index], cornerRadius: show ? 10 : 22)
                            .matchedGeometryEffect(id: items[index].id, in: namespace, properties: .frame, isSource: !items[index].show)
                            .frame(maxHeight: 300)
                    }
                    .zIndex(items[index].index)
                    .onTapGesture {
                        items[index].index = Double(index)
                        items[index].show.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            show = true
                            showNavBar = false
                        }
                    }
                }
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.8))
            .padding(.all, 20)
            
            SectionTitle(title: "Recent sections")
            CourseContent()
        }
    }
    
    var fullContent: some View {
        ForEach(items.indices) { index in
            if items[index].show {
                ScrollView {
                    VStack {
                        CourseItem(course: items[index], cornerRadius: show ? 10 : 22)
                            .matchedGeometryEffect(id: items[index].id, in: namespace, properties: .frame, isSource: items[index].show)
                            .frame(maxHeight: 300)
                            .zIndex(1)
                        VStack {
                            SectionTitle(title: "Recent sections")
                            CourseContent()
                            CourseSectionContent()
                        }
                        .offset(y: show ? 0 : -100)
                        .opacity(show ? 1 : 0)
                        .zIndex(0)
                    }
                    .background(
                        Color("Background 1")
                            .opacity(show ? 1 : 0)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .frame(maxWidth: 712)
                .edgesIgnoringSafeArea(.vertical)
                .frame(maxWidth: .infinity)
                .animation(.spring(response: 0.4, dampingFraction: 0.8))
                .background(
                    BlurView()
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn(duration: 0.5))
                        .edgesIgnoringSafeArea(.all)
                )
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            CloseButton()
                                .padding(.horizontal)
                                .opacity(show ? 1 : 0)
                                .animation(.easeIn)
                                .onTapGesture {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        items[index].index = -1
                                    }
                                    items[index].show.toggle()
                                    show = false
                                    showNavBar = true
                                }
                        }
                        Spacer()
                    }
                )
            }
        }
    }
    
    var tabView: some View {
        TabView {
            NavigationView {
                content
                    .navigationTitle(showNavBar ? "Courses" : "")
            }
            .tabItem { Image(systemName: "book.closed")
                Text("Courses") }
            
            NavigationView {
                TutorialsView()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView {
                LivestreamsView()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView {
                CertificatesView()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView {
                SearchView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
    
    var sidebar: some View {
        NavigationView {
            List(selection: $selection) {
                NavigationLink(destination: content
                                .navigationTitle(showNavBar ? "Courses" : "")
                                .statusBar(hidden: !showNavBar)) {
                    Label("Courses", systemImage: "book.closed")
                }
                .tag(NavigationItem.courses)
                
                NavigationLink(destination: TutorialsView()) {
                    Label("Tutorials", systemImage: "list.bullet.rectangle")
                }
                .tag(NavigationItem.tutorials)
                
                NavigationLink(destination: LivestreamsView()) {
                    Label("Livestreams", systemImage: "tv")
                }
                .tag(NavigationItem.downloads)
                
                NavigationLink(destination: CertificatesView()) {
                    Label("Certificates", systemImage: "mail.stack")
                }
                .tag(NavigationItem.downloads)
                
                NavigationLink(destination: SearchView()) {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(NavigationItem.search)
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle").font(.system(size: 22, weight: .light))
                    }
                }
            }
            content
                .navigationTitle(showNavBar ? "Courses" : "")
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
