//
//  User.swift
//  AvatarCohabiting-Example
//
//  Created by William Boles on 04/10/2026.
//

import Foundation

struct User: Sendable {
    let name: String
    let avatarURL: URL?
    let isOnline: Bool
}
