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
        case 0: return json(fromDictionary: ["id": 0, "name": "Someone else", "profilePicture": "url_here"])
        case 1: return json(fromDictionary: ["id": 1, "name": "Someone else 1", "profilePicture": "url_here"])
        case 2: return json(fromDictionary: ["id": 2, "name": "Me", "profilePicture": "https://avatars2.githubusercontent.com/u/705433?s=460&v=4"])
        default:
            return nil
        }
    }
    
    /// Retreives the list of meetings
    /// The strings generated still contain some escaping characters, you may need to edit this method :)
    func meetings(forUser user: User) -> String? {
        switch user.id {
        case 2:
            
            return """
                [
                {\"name\":\"Meeting 1\",
                \"date\":\"2020-05-04T9:15:00Z",
                \"participants\":
                  [{\"id\": 0, \"name\": \"Someone\", \"profilePicture\": \"url_here\"},
                   {\"id\": 1, \"name\": \"Someone else\", \"profilePicture\": \"https://avatars0.githubusercontent.com/u/23079649?s=400&v=4\"}]},
                {\"name\":\"Meeting 2\",
                  \"date\":\"2020-05-15T9:15:00Z",
                  \"participants\":
                    [{\"id\": 0, \"name\": \"Someone\", \"profilePicture\": \"url_here\"},
                     {\"id\": 1, \"name\": \"Someone else\", \"profilePicture\": \"https://avatars0.githubusercontent.com/u/23079649?s=400&v=4\"}]},
                {\"name\":\"Meeting 3\",
                \"date\":\"2020-07-16T14:25:00Z",
                \"participants\":
                  [{\"id\": 0, \"name\": \"Francis\", \"profilePicture\": \"url_here\"},
                   {\"id\": 1, \"name\": \"Marcos\", \"profilePicture\": \"url_here"}]}
                ]
            """
        default:
            return nil
        }
    }
}
