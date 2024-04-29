//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

// struct untuk membuat tampilan mengedit profile
struct ProfileEditor: View {
    @Binding var profile: Profile
    
    // inisiasi range untuk tanggal 'Goal Date'
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            // membuat toogle untuk mengaktifkan atau tidak notifikasi
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // mengeluarkan pilihan untuk seasonal photo
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            // mengeluarkan pilihan untuk tampilan 'Goal Date'
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                    Text("Goal Date")
                }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
