//
//  User.swift
//  Interview
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
struct User: Codable {
    var id: Int
    var name: String
    var profilePicture: String
    
    // custom decoder required for type conversion of id (String -> Int)
    enum CodingKeys: CodingKey { case id, name, profilePicture }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decode(String.self, forKey: .id)
        id = Int(idString)!
        
        name = try container.decode(String.self, forKey: .name)
        profilePicture = try container.decode(String.self, forKey: .profilePicture)
    }
}
