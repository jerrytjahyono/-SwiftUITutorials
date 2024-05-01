//
//  ContentView.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 19/04/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
           case featured
           case list
       }
     
    var body: some View {
        TabView(selection: $selection) {
            
            // membuat tab featured
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            // membuat tab list
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
