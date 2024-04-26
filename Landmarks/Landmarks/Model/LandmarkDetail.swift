//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI

// Struct landmarkDetail yang dapat digunakan kembali dengan memanggilnya yang akan menampilkan map, image dalam bentuk lingkaran, dan text
struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        
        // function swift untuk dapat melakukan scrool pada view
        ScrollView {
            VStack {
                
                // menampilkan view map
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                // menampilkan image dalam bentuk bulat
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    
                    
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    
                    Divider()
                    
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
                
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
