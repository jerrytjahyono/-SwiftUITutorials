//
//  CategoryHome.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

struct CategoryHome: View {
    // inisasi ModelData yang dapat di panggil
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        
        // membuat tampilan layar menjadi split pada ukuran ipad ke atas
        NavigationSplitView{
    
            // mengeluarkan list yang ada pada model data category
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            
                // memberikan tampilan yang lebih pas ukuran nya dengan device
                .listStyle(.inset)
            
                // memberikan judul pada bagian layar split
                .navigationTitle("Featured")
                
                // memberikan tampilan logo user yang ditekan akan mengeluarkan profile summary
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                    .environment(modelData)
                }
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
