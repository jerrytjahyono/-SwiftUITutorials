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
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                
            
            // menampilkan data nama pada data landmark
            Text(landmark.name)
                .bold()
            #if !os(watchOS)
            Text(landmark.park)
                .font(.caption)
                .foregroundStyle(.secondary)
            #endif
            }
            
            Spacer()
            
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview{
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

