//
//  MessageRow.swift
//  AvatarShared-Example
//
//  Created by William Boles on 04/10/2026.
//

import SwiftUI

struct MessageRow: View {
    let sender: User

    var body: some View {
        AvatarView(user: sender,
                   size: 40)
            .overlay(alignment: .topTrailing) {
                if sender.isOnline {
                    Circle()
                        .fill(.green)
                        .frame(width: 12, height: 12)
                }
            }
    }
}

#Preview("Online") {
    MessageRow(sender: User(name: "William",
                            avatarURL: nil,
                            isOnline: true))
}

#Preview("Offline") {
    MessageRow(sender: User(name: "William",
                            avatarURL: nil,
                            isOnline: false))
}
