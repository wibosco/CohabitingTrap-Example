//
//  ProfileHeader.swift
//  AvatarShared-Example
//
//  Created by William Boles on 04/10/2026.
//

import SwiftUI

struct ProfileHeader: View {
    let user: User

    var body: some View {
        AvatarView(user: user,
                   size: 96)
            .overlay(alignment: .bottomTrailing) {
                Image(systemName: "pencil.circle.fill")
            }
    }
}

#Preview {
    ProfileHeader(user: User(name: "William",
                             avatarURL: nil,
                             isOnline: true))
}
