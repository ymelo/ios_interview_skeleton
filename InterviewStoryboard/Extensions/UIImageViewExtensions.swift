//
//  UIImageViewExtensions.swift
//  InterviewStoryboard
//
//  Created by Ian Turner on 13/05/2020.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation
import UIKit

/// Extension courtesy of Paul Hudson @ Hacking With Swift
/// see https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
