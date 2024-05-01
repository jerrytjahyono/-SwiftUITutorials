//
//  ProfileHost.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 29/04/24.
//

import SwiftUI

// struct untuk menampilkan profile host
struct ProfileHost: View {
    // inisiasi editMode untuk tampilan
    @Environment(\.editMode) var editMode
    
    @Environment(ModelData.self) var modelData
    
    // inisiasi default profile
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                // tampilan edit mode yang dapat berinteraksi pada tombol cancel dan done
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
             
            // menampilkan logo edit dan dapat berinteraksi dengan menu edit
            if editMode?.wrappedValue == .inactive {
                
                // memanggil struct profile summary yang berisi tampilan profile user
                ProfileSummary(profile: modelData.profile)
            } else {
                
                // memanggil struct ProfileEditor untuk mengeluarkan tampilan edit profile
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
            .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
