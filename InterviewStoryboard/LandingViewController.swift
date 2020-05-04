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
    private var meetingData: [Meeting]!

    override func viewDidLoad() {
        guard let user = getUser() else {
            return
        }

        populateUserInfo(user: user)
        populateMeetings(user: user)
    }

    private func getUser() -> User? {
        let decoder = JSONDecoder()
        if let jsonString = MockedData().currentUser(),
            let jsonData = jsonString.data(using: .utf8) {
            return try? decoder.decode(User.self, from: jsonData)
        }
        return nil
    }

    private func populateUserInfo(user: User) {

        profileName.text = user.name

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData: Data = try Data(contentsOf: user.profilePicture)

                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    self.profilePicture.image = image
                    self.profilePicture.sizeToFit()
                }
            } catch {
            }
        }
    }

    private func populateMeetings(user: User) {
        let meetings = Self.getMeetings(user: user)
        self.meetingData = meetings.filter({ (meeting) -> Bool in
            return Calendar.current.isDateInToday(meeting.date)
        })
    }

    static func getMeetings(user: User) -> [Meeting] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let jsonString = MockedData().meetings(forUser: user),
            let jsonData = jsonString.data(using: .utf8),
            let meetings = try? decoder.decode([Meeting].self, from: jsonData) {
            return meetings
        }
        return [Meeting]()
    }
}

extension LandingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meetingData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "meeting_collection_view", for: indexPath) as! SimpleCollectionCell
        cell.title.text = meetingData[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mvc = storyboard?.instantiateViewController(withIdentifier: "MeetingScene") as? MeetingViewController
        mvc?.modalPresentationStyle = .fullScreen
        mvc?.meetingData = meetingData[indexPath.row]
        present(mvc!, animated: true)
    }
}
