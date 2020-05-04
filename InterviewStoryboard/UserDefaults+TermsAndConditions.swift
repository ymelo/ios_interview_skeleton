//
//  UserDefaults+TermsAndConditions.swift
//  InterviewStoryboard
//
//  Created by Michael Charland on 2020-05-04.
//  Copyright © 2020 Yohann Melo. All rights reserved.
//

import Foundation

private let hasAcceptedTermsAndConditionsKey = "hasAcceptedTermsAndConditions"

extension UserDefaults {

    func acceptTermsAndConditions(){
        UserDefaults().set(true, forKey: hasAcceptedTermsAndConditionsKey)
    }

    func hasAcceptedTermsAndConditions() -> Bool {
        return UserDefaults().bool(forKey: hasAcceptedTermsAndConditionsKey)
    }

}
