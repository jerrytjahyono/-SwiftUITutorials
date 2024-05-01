//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 27/04/24.
//

import CoreGraphics

// struktur yang berisi data ukuran hexagon dalam bentuk parameter untuk membuat bentuk bentuk hexagon
struct HexagonParameters {
    
    // merupakan struktur yang isinya inisiasi 3 hal yang diperlukan dalam membuat bentuk hexagon
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    // inisiasi nilai untuk menjadi nilai penyesuaian yang pas untuk membuat bentuk hexagon
    static let adjustment: CGFloat = 0.085
    
    // array untuk menampung data segment untuk keperluan pembuatan bentuk hexagon
    static let segments = [
        
        // menambahkan nilai untuk setiap titik untuk membuat bentuk hexagon
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        
        // ditambahkan adjustment untuk menyetel pembentukan bentuk hexagon
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
