//
//  CertificatesView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/7/20.
//

import SwiftUI

struct CertificatesView: View {
    @State var show = true
    @State var items = courses
    
    var content: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: show ? 200 : 700))],
            spacing: 16) {
            
            ForEach(items.indices) { index in
                let flipView = FlipView(
                    item1: items[index],
                    item2: items[courses.count - index - 1],
                    color1: gradients[index].color1,
                    color2: gradients[index].color2
                )
                .frame(height: items[index].show ? 360 : 220)
                .onTapGesture {
                    items[index].show.toggle()
                }
                
                switch index {
                case 0:
                    flipView
                        .zIndex(3)
                case 1:
                    flipView
                        .offset(x: 0, y: show ? 0 : -200)
                        .scaleEffect(show ? 1 : 0.9)
                        .opacity(show ? 1 : 0.3)
                        .zIndex(2)
                case 2:
                    flipView
                        .offset(x: 0, y: show ? 0 : -450)
                        .scaleEffect(show ? 1 : 0.8)
                        .opacity(show ? 1 : 0.3)
                        .zIndex(1)
                default:
                    flipView
                        .offset(x: 0, y: show ? 0 : 0)
                        .scaleEffect(show ? 1 : 0.7)
                        .opacity(show ? 1 : 0)
                        .zIndex(0)
                }
            }
        }
        .animation(.easeInOut(duration: 0.8))
        .padding(.all, 16)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color("Background 3").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                DateTitle(title: "Certificates")
                content
            }
            .navigationTitle("Certificates")
            .navigationBarHidden(true)
            
            Button(action: { show.toggle() }) {
                ToggleButton()
            }
            .padding()
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
