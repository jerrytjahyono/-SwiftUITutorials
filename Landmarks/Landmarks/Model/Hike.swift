//
//  Hike.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 27/04/24.
//

import Foundation

// struktur data Hike yang dapat digunakan pada setiap file yang membutuhkan data landmark, yang berisi properti tampilan Hike
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]


    static var formatter = LengthFormatter()


    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }


    struct Observation: Codable, Hashable {
        var distanceFromStart: Double


        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
