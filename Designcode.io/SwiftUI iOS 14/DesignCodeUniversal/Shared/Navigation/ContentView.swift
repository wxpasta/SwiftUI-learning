//
//  ContentView.swift
//  Shared
//
//  Created by Meng To on 6/28/20.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    @ViewBuilder
    var body: some View {
        #if os(iOS)
        CoursesView()
        #else
        Sidebar()
            .frame(minWidth: 1000, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
