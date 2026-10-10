//
//  AvatarView.swift
//  AvatarCohabiting-Example
//
//  Created by William Boles on 04/10/2026.
//

import SwiftUI

struct AvatarView: View {
    let user: User
    let size: CGFloat
    let showEditBadge: Bool
    let showOnlineStatus: Bool

    var body: some View {
        photoOrInitial
            .frame(width: size, height: size)
            .background(.gray)
            .clipShape(Circle())
            .overlay(alignment: .bottomTrailing) {
                if showEditBadge {
                    Image(systemName: "pencil.circle.fill")
                }
            }
            .overlay(alignment: .topTrailing) {
                if showOnlineStatus && user.isOnline {
                    Circle()
                        .fill(.green)
                        .frame(width: 12, height: 12)
                }
            }
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

#Preview("Profile configuration") {
    AvatarView(user: User(name: "William",
                          avatarURL: nil,
                          isOnline: true),
               size: 96,
               showEditBadge: true,
               showOnlineStatus: false)
}

#Preview("Message configuration") {
    AvatarView(user: User(name: "William",
                          avatarURL: nil,
                          isOnline: true),
               size: 40,
               showEditBadge: false,
               showOnlineStatus: true)
}
