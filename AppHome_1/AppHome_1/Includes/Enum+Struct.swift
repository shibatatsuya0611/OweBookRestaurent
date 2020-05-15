//
//  Enum+Struct.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_8        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6_8P       = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XR_SMAX    = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO10        = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1112.0
    static let IS_IPAD_PRO12        = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    
    static let IS_IPHONE_NOTCH_DEVICE = (UIDevice.current.userInterfaceIdiom == .phone) && (ScreenSize.SCREEN_MAX_LENGTH == 896.0 || ScreenSize.SCREEN_MAX_LENGTH == 812.0)
}

struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0 && Version.SYS_VERSION_FLOAT < 11.0)
    static let iOS11 = (Version.SYS_VERSION_FLOAT >= 11.0 && Version.SYS_VERSION_FLOAT < 12.0)
    static let iOS12 = (Version.SYS_VERSION_FLOAT >= 12.0 && Version.SYS_VERSION_FLOAT < 13.0)
    static let iOS13 = Version.SYS_VERSION_FLOAT >= 13.0
}

struct VersionAndNewer {
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0)
    static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0)
    static let iOS11 = (Version.SYS_VERSION_FLOAT >= 11.0)
    static let iOS12 = (Version.SYS_VERSION_FLOAT >= 12.0)
}
public typealias PHSyncResponse = [String: Any]


enum typeImage: Int {
    case Restaurant = 1
    case NoImage = 2
    case Food = 3
    case Avatar = 4
    case BannerRestaurant = 5
    case TypeRestaurant = 6
    case Gallery = 7
    case PreviewImage = 8
    case NoEvent = 9
    case NoCoupon = 10
    case CustomerOrder = 11
    case Default = 12
}
