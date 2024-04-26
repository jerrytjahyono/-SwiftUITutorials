//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI

// membuat struck landmarkRow yang dapat digunakan untuk menampilkan image, name landmark per satu data saja
struct LandmarkRow: View {
    // inisiasi dari model data 'Landmark' sehingga dapat mengakses data landmark yang awalnya json
    var landmark : Landmark
    var body: some View {
        HStack{
            
            // menampilkan data gambar pada data landmark
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            // menampilkan data nama pada data landmark
            Text(landmark.name)
            
            Spacer()
        }
    }
}

#Preview{
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

