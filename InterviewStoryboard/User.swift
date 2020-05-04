//
//  User.swift
//  Interview
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
struct User: Decodable {
    var id: Int
    var name: String
    var profilePicture: URL
}

struct Meeting: Decodable {
    var name: String
    var participants: [User]
    var date: Date
}
