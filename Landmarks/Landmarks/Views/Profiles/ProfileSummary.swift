//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

// menampilkan informasi mengenai profil user
struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    
    // inisiasi dari model data 'Profile'
    var profile: Profile

    var body: some View {
        
        // membuat tampilan menjadi dapat di scroll
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                // menampilkan username dari profile
                Text(profile.username)
                    .bold()
                    .font(.title)
 

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()

                // menampilkan badges
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                    .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                    }
                        .padding(.bottom)
                    }
                }
                Divider()

                // menampilkan hikes
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
