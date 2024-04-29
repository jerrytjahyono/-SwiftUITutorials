//
//  Profile.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import Foundation

// membuat struct profile yang berisi properti model data profile
struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    // inisiasi default profile
    static let `default` = Profile(username: "g_kumar")

    // insiasi enum untuk season
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue }
    }
}
