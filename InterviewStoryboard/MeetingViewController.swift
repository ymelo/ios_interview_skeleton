//
//  MeetingViewController.swift
//  InterviewStoryboard
//
//  Created by Yohann Melo on 2020-02-13.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import UIKit

class MeetingViewController: UIViewController {

    @IBOutlet weak var meetingName: UILabel!
    @IBOutlet weak var users: UICollectionView!
    @IBOutlet weak var date: UILabel!

    var meetingData: Meeting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meetingName.text = meetingData.name
        date.text = meetingData.date.description
    }

    @IBAction func dismissButtonPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension MeetingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meetingData.participants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "user_collection_view", for: indexPath) as! UserCollectionCell
        let participant = meetingData.participants[indexPath.row]
        cell.name.text = participant.name
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData: Data = try Data(contentsOf: participant.profilePicture)

                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    cell.imageView.image = image
                    cell.imageView.sizeToFit()
                }
            } catch {
            }
        }
        return cell
    }
}

