//
//  MockedData.swift
//  InterviewStoryboard
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
class MockedData {
    
    fileprivate func json(fromDictionary dictionary: [String : String]) -> String? {
        do {
            let json = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return String(data: json, encoding: .ascii)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    func currentUser() -> String? {
        return user(withId: 2)
    }
    
    func user(withId id: Int) -> String? {
        switch id {
        case 0: return json(fromDictionary: ["id": "0", "name": "Someone else", "profilePicture": "url_here"])
        case 1: return json(fromDictionary: ["id": "1", "name": "Someone else 1", "profilePicture": "url_here"])
        case 2: return json(fromDictionary: ["id": "2", "name": "Me", "profilePicture": "url_here"])
        default:
            return nil
        }
    }
}
