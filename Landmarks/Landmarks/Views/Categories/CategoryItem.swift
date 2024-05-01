//
//  CategoryItem.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

struct CategoryItem: View {
    
    // inisiasi data landmark
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            
            // mengeluarkan data image dari landmark
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            // mengeluarkan data nama dari landmark
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}

