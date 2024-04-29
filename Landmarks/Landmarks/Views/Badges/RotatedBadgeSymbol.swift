//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 27/04/24.
//

import SwiftUI
 
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    // membuat logo gambar badge menjadi sedikit serong kanan
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}


#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
