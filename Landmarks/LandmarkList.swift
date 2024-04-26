//
//  LandmarkList.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI

// membuat struct untuk dapat digunakan kembali yang dapat menampilkan semua data landmark yang menggunakan struck landmarkRow untuk mengambil dan menampilkan setiap data landmark
struct LandmarkList: View {
    var body: some View {
        
        // memberikan navigasi, jika pada ukuran device ipad ke atas dapat terjadi split view. 
        NavigationSplitView {
            
            // melakukan for each data landmark sesuai dengan semua id yang ada pada data landmark.
            List(landmarks, id: \.id) {landmark in
                
                // dapat merujuk ke halaman detail pada setiap data landmark yang di tekan/dituju.
                NavigationLink {
                    
                    // memanggil struct landmarkDetial yang berisi detail dari masing - masing landmark.
                    LandmarkDetail(landmark: landmark)
                } label: {
                    
                    // memanggil struct landmarkRow untuk dapat menampilkan setiap data landmark
                    LandmarkRow(landmark: landmark)
                }
            }
            
            // menampilkan judul dari judul navigasi list landmark
            .navigationTitle("Landmarks")
            
        // menampilkan tampilan awal sebelum memilih landmark yang mau dituju
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
