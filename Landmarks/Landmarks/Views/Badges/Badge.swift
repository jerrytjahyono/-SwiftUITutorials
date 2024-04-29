//
//  Badge.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 27/04/24.
//

import SwiftUI

struct Badge: View { 
    
    // membuat logo badge yang awalnya hanya 1 buah menjadi 8 buah dan di buat rotate agar membuat seperti bintang.
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            
            // memanggil struct badge background
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}


#Preview {
    Badge()
}
