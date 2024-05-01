//
//  ContentView.swift
//  MacLandmarks
//
//  Created by jerry tri tjahyono on 01/05/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarkList()
              .frame(minWidth: 700, minHeight: 300)
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
