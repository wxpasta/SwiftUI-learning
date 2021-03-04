//
//  TabBar.swift
//  iOS
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                CoursesView()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Courses")
            }
            
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
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
