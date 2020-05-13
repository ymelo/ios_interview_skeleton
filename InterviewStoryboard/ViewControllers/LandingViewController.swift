//
//  LandingViewController.swift
//  InterviewStoryboard
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var meetings: UICollectionView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    var user: User?
    var userMeetings: [Meeting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data for user
        if let user = getCurrentUser() {
            profileName.text = user.name;
            profilePicture.load(url: URL(string: user.profilePicture)!) // assuming URL was validated when saved
            
            // load user meetings
            userMeetings = getUserMeetings(forUser: user)!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "meetingDetailsSegue" {
            let destinationVC = segue.destination as! MeetingViewController
            if let indexPath = meetings.indexPathsForSelectedItems?.first {
                destinationVC.selectedMeeting = userMeetings[indexPath.item]
            }
        }
    }
    
    // MARK: - Data
    func getCurrentUser() -> User? {
        let data = MockedData()
        
        if let userStr = data.currentUser() {
            let jsonData = userStr.data(using: .utf8)!
            let decoder = JSONDecoder()
            let currentUser = try! decoder.decode(User.self, from: jsonData)
            return currentUser
        }
        
        return nil
    }
    
    func getUserMeetings(forUser user: User) -> [Meeting]? {
        let data = MockedData()
        
        if let meetingsStr = data.meetings(forUser: user) {
            let jsonData = meetingsStr.data(using: .utf8)!
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let meetings = try! decoder.decode([Meeting].self, from: jsonData)
            return meetings
        }
        
        return nil
    }
}

// MARK: - Datasource
extension LandingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userMeetings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = meetings.dequeueReusableCell(withReuseIdentifier: "meeting_collection_view", for: indexPath) as! SimpleCollectionCell
        
        cell.layer.backgroundColor = CGColor(srgbRed: 0.1, green: 0.7, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 8.0
        
        cell.title.textColor = .white
        let formattedDate = userMeetings[indexPath.item].date.meetingFormat()
        cell.title.text = "\(formattedDate)\n\(userMeetings[indexPath.item].name)"
        
        return cell
    }
    
}

// MARK: - Behaviour
extension LandingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item \(indexPath.item + 1) - \(userMeetings[indexPath.item])")
        
    }
    
}
