//
//  MockedData.swift
//  InterviewStoryboard
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//
/*
This class is a very simple example to give you an idea of what the data should look like.
It's on purpose using dictionary so we didn't have to worry about the actual structures to store them.
You can edit this class as much as you want to fit your needs!
*/
import Foundation

class MockedData {
    
    /// Simple helper method to generate some JSON strings
    /// The strings generated still contain some escaping characters, you may need to edit this method :)
    fileprivate func json(fromDictionary dictionary: [String : Any]) -> String? {
        do {
            let json = try JSONSerialization.data(withJSONObject: dictionary, options: [.withoutEscapingSlashes])
            return String(data: json, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    /// Retreive the "current user" (consider this to be your user when you log-in
    /// The strings generated still contain some escaping characters, you may need to edit this method :)
    func currentUser() -> String? {
        return user(withId: 2)
    }
    
    /// Retreive a user
    /// The strings generated still contain some escaping characters, you may need to edit this method :)
    func user(withId id: Int) -> String? {
        switch id {
        case 0: return json(fromDictionary: ["id": "0", "name": "John", "profilePicture": "https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png"])
        case 1: return json(fromDictionary: ["id": "1", "name": "Jane", "profilePicture": "https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png"])
        case 2: return json(fromDictionary: ["id": "2", "name": "James", "profilePicture": "https://cdn.iconscout.com/icon/free/png-256/avatar-367-456319.png"])
        default:
            return nil
        }
    }
    
    /// Retreives the list of meetings
    /// The strings generated still contain some escaping characters, you may need to edit this method :)
    func meetings(forUser user: User) -> String? {
        switch user.id {
        case 2:
            return "[{\"name\":\"Daily meeting\", \"date\":\"2020-05-14T14:00:00Z\", \"participants\":[{\"id\": \"1\", \"name\": \"Jane\", \"profilePicture\": \"https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png\"},{\"id\": \"0\", \"name\": \"John\", \"profilePicture\": \"https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png\"}]},{\"name\":\"Team Meeting\", \"date\":\"2020-05-14T15:30:00Z\", \"participants\":[{\"id\": \"0\", \"name\": \"John\", \"profilePicture\": \"https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png\"}, {\"id\": \"1\", \"name\": \"Jane\", \"profilePicture\": \"https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png\"}]}]"
        default:
            return nil
        }
    }
}
