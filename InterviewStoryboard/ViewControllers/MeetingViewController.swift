//
//  MeetingViewController.swift
//  InterviewStoryboard
//
//  Created by Ian Turner on 13/05/2020.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import UIKit

class MeetingViewController: UIViewController {
    
    var selectedMeeting: Meeting?
    
    @IBOutlet weak var meetingName: UILabel!
    @IBOutlet weak var meetingDateTime: UILabel!
    @IBOutlet weak var participants: UICollectionView!
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard selectedMeeting != nil else { return }
        meetingDateTime.text = selectedMeeting?.date.meetingFormat()
        meetingName.text = selectedMeeting?.name
    }
    
    //    private func formatDate(from date: Date) -> String {
    //        let format = DateFormatter.dateFormat(fromTemplate: "HH:mm - MMM dd", options: 0, locale: Locale.current) ?? "n/a"
    //
    //        let formatter: DateFormatter = DateFormatter()
    //        formatter.dateFormat = format
    //
    //        return formatter.string(from: date as Date)
    //    }
}

// MARK: - Datasource
extension MeetingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMeeting?.participants.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = participants.dequeueReusableCell(withReuseIdentifier: "meetingUserCell", for: indexPath) as! MeetingUserCollectionCell
        
        cell.layer.cornerRadius = 8.0
        
        cell.participantName.text = selectedMeeting?.participants[indexPath.item].name
        cell.participantProfileImage.load(url: URL(string: (selectedMeeting?.participants[indexPath.item].profilePicture)!)!)

        return cell
    }
    
}

