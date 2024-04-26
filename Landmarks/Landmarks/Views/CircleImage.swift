//
//  CircleImage.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI

struct CircleImage: View {
    
    // inisiasi image dan menampung data Image
    var image: Image
    var body: some View {
        
        //memanggil inisiasi di atas pada data image dan melakukan pengeditan image.
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
