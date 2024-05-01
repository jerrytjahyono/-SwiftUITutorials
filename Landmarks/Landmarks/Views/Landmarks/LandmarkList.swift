//
//  LandmarkList.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI

// membuat struct untuk dapat digunakan kembali yang dapat menampilkan semua data landmark yang menggunakan struck landmarkRow untuk mengambil dan menampilkan setiap data landmark
struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    
    //inisiasi variabel yang dilakukan jika terjadi perubahan akan melakukan perenderan ulang sehingga dapat menampilkan landmark yang hanya di favorite
    @State private var showFavoritesOnly = true
    
    @State private var filter = FilterCategory.all
    
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    // closure untuk melakukan filter landmark yang hanya di sukai
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
                    && (filter == .all || filter.rawValue == landmark.category.rawValue)
            }
        }
    
    var title: String {
         let title = filter == .all ? "Landmarks" : filter.rawValue
         return showFavoritesOnly ? "Favorite \(title)" : title
     }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    
    var body: some View {
        @Bindable var modelData = modelData
        
        // memberikan navigasi, jika pada ukuran device ipad ke atas dapat terjadi split view.
        NavigationSplitView {
            
            // melakukan for each data landmark sesuai dengan semua id yang ada pada data landmark.
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    // dapat merujuk ke halaman detail pada setiap data landmark yang di tekan/dituju.
                    NavigationLink {
                        
                        // memanggil struct landmarkDetial yang berisi detail dari masing - masing landmark.
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        
                        // memanggil struct landmarkRow untuk dapat menampilkan setiap data landmark
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            
            .navigationTitle(title)
            
            // menampilkan judul dari judul navigasi list landmark
            .navigationTitle("Landmarks")
            
            .frame(minWidth: 300)
            
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        // menampilkan tampilan awal sebelum memilih landmark yang mau dituju
        } detail: {
            Text("Select a landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
           .environment(ModelData())
}
