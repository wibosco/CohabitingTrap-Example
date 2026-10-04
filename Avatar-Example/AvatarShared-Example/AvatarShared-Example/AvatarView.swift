//
//  AvatarView.swift
//  AvatarShared-Example
//
//  Created by William Boles on 04/10/2026.
//

import SwiftUI

struct AvatarView: View {
    let user: User
    let size: CGFloat

    var body: some View {
        photoOrInitial
            .frame(width: size, height: size)
            .background(.gray)
            .clipShape(Circle())
    }

    @ViewBuilder
    private var photoOrInitial: some View {
        if let avatarURL = user.avatarURL {
            AsyncImage(url: avatarURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    initial
                case .empty:
                    ProgressView()
                @unknown default:
                    initial
                }
            }
        } else {
            initial
        }
    }

    private var initial: some View {
        Text(user.name.prefix(1))
    }
}

#Preview("Profile size") {
    AvatarView(user: User(name: "William",
                          avatarURL: nil,
                          isOnline: true),
               size: 96)
}

#Preview("Message size") {
    AvatarView(user: User(name: "William",
                          avatarURL: nil,
                          isOnline: true),
               size: 40)
}
