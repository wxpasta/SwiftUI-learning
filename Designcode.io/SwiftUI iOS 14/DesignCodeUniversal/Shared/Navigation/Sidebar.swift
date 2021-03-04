//
//  SidebarView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 6/28/20.
//

import SwiftUI

enum NavigationItem {
    case courses
    case tutorials
    case livestreams
    case certificates
    case downloads
    case search
}

struct Sidebar: View {
    @State var selection: Set<NavigationItem> = [.courses]
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            sidebar
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle").font(.system(size: 22, weight: .light))
                        }
                    }
                }
            #else
            sidebar
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
                .toolbar {
                    ToolbarItem(placement: .status) {
                        HStack {
                            Text("Meng To")
                            Spacer()
                        }
                    }
                    ToolbarItem(placement: .status) {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    }
                }
            #endif
            Text("Select content")
        }
    }
    
    var sidebar: some View {
        List(selection: $selection) {
            
            NavigationLink(destination: CoursesView()) {
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
            .tag(NavigationItem.livestreams)
            
            NavigationLink(destination: CertificatesView()) {
                Label("Certificates", systemImage: "mail.stack")
            }
            .tag(NavigationItem.certificates)
            
            NavigationLink(destination: DownloadsView()) {
                Label("Downloads", systemImage: "square.and.arrow.down")
            }
            .tag(NavigationItem.downloads)
            
            NavigationLink(destination: SearchView()) {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(NavigationItem.search)
            
            Spacer()
            
            Group {
                Text("Progress")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .opacity(0.4)
                
                Label("Continue Watching", systemImage: "play.circle")
                Label("Favorites", systemImage: "heart")
                Label("Downloaded", systemImage: "square.and.arrow.down.on.square")
                Label("Updates", systemImage: "lineweight")
            }
            
            Spacer()
            
            Group {
                Text("Platforms")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .opacity(0.4)
                
                Label("SwiftUI", systemImage: "swift")
                Label("UI Design", systemImage: "skew")
                Label("React", systemImage: "chevron.left.slash.chevron.right")
                Label("Prototyping", systemImage: "arrow.turn.up.right.iphone")
            }
        }
        .listStyle(SidebarListStyle())
    }
}


struct MacView_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
