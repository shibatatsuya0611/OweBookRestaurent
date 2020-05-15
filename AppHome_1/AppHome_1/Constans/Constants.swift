//
//  Constants.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

let INIT_USER_DEFAULTS = UserDefaults.standard

// if current user id == 0 >> not login
private var currentuserid: Int?
public var CURRENT_USER_ID: Int {
    get {
        if INIT_USER_DEFAULTS.integer(forKey: "currentUserId") != 0 {
            currentuserid = INIT_USER_DEFAULTS.integer(forKey: "currentUserId")
            return currentuserid!
        } else {
            return 0
        }
    }
    set(value) {
        currentuserid = value
    }
}
fileprivate var fcmtoken: String?
public var FCM_TOKEN: String {
    get {
        if let token = INIT_USER_DEFAULTS.string(forKey: "fcmToken") {
            fcmtoken = token
            return fcmtoken ?? ""
        } else {
            return ""
        }
    }
    set(value) {
        fcmtoken = value
    }
}
