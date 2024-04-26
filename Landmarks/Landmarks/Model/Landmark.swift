//
//  Landmark.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import SwiftUI
import CoreLocation

// struktur data Landmark yang dapat digunakan pada setiap file yang membutuhkan data landmark
struct Landmark: Codable, Hashable {
    // inisiasi keperluan properti Landmark
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // menggambil dan inisiasi data 'imageName' yang ada pada data landmark dalam bentuk UI
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // menggambil dan inisiasi data 'coordinates' yang ada pada data landmark dalam bentuk UI
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D (
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
            )
    }
    
    // menggambil dan inisiasi data 'coordinates' yang ada pada data landmark dalam bentuk data
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
