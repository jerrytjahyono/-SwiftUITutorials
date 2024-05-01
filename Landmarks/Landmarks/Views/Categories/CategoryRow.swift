//
//  CategoryRow.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

struct CategoryRow: View {
    
    // inisiasi nama categori dan items dalam bentuk 'array landmark'
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
             
            // mengeluarkan nama dari categori
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // mengeluarkan items dalam bentuk array yang sudah di inisiasi di atas
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
       return CategoryRow(
           categoryName: landmarks[0].category.rawValue,
           items: Array(landmarks.prefix(4))
       )
}
