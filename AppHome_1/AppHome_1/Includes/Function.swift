//
//  Functions.swift
//  EasyFood Merchant
//
//  Created by phuong on 12/4/19.
//  Copyright © 2019 EasyFoodMerchant. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

func appDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

// MARK: VALIDATE EMAIL
func validateEmail(enteredEmail:String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
    
}

// ============= UPLOAD MULTI FILES WITH PARAMESTER via ALAMOFIRE ========



func saveImageDocumentDirectory(image: UIImage, path: String){
    
    let fileManager = FileManager.default
    
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(path + ".jpg")
    
    
    
    print(paths)
    let imageData = image.jpegData(compressionQuality: 1)
    fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    
}

// MARK: round double
func round(a: Double, est: Double = 1.0) -> Double {
    let mu = pow(10.0,est)
    let r = round(a*mu)/mu
    return r
}

// MARK: get symbol of country
func getSymbol(forCurrencyCode code: String) -> String? {
    let locale = NSLocale(localeIdentifier: code)
    return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
}

// MARK: SCALE ANIMATION
func scaleAnimation(duration: CFTimeInterval = 0.3, keyPath: String = "transform.scale") -> CAKeyframeAnimation {
    let impliesAnimation = CAKeyframeAnimation(keyPath: keyPath)
    impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
    impliesAnimation.duration = duration * 2
    impliesAnimation.calculationMode = CAAnimationCalculationMode.cubicPaced
    
    return impliesAnimation
}

// MARK: ============== CONVERT KM TO METER ============
/// type 1 km -> meter
/// type 2 meter -> km
func convertKilometToMeter(input value: Double, type: Int = 1) -> Double {
    if type == 1 {
        return value * 1000
    } else {
        return value / 1000
    }
}

// MARK: commas curency
/// commas currency
/// format price
func commasCurreny(price: Int) -> String? {
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formattedNumber = numberFormatter.string(from: NSNumber(value: price))
    
    return formattedNumber
}

// MARK: convert string json to disctionary
func convertStringJsonToDictionary(text: String) -> PHSyncResponse? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? PHSyncResponse
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


// MARK: make label with padding
func makeLabel(title:String, x:CGFloat, y:CGFloat, w:CGFloat, h:CGFloat, font: UIFont, textColor: UIColor, bgColor: UIColor, fontMargin: UIFont) -> UILabel {
//    var myLabel : UILabel = UILabel(frame: CGRectMake(x,y,w,h))
    let myLabel: UILabel = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
    myLabel.textAlignment = NSTextAlignment.right

    // inser last char to right
    let titlePlus1char = "\(title)1"
    myLabel.text = titlePlus1char
    let titleSize: Int = titlePlus1char.count - 1

    myLabel.textColor = textColor
    myLabel.backgroundColor = bgColor


    // create myMutable String
    var myMutableString = NSMutableAttributedString()

    // create myMutable font
    myMutableString = NSMutableAttributedString(string: titlePlus1char, attributes: [NSAttributedString.Key.font:font])

    // set margin size
    myMutableString.addAttribute(NSAttributedString.Key.font, value: fontMargin, range: NSRange(location: titleSize,length: 1))

    // set last char to alpha 0
    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red:1.0, green:1.0,blue:1.0,alpha:0), range: NSRange(location: titleSize,length: 1))

    myLabel.attributedText = myMutableString

    return myLabel
}

/// ================ caculation height of description =====================
func estimateHeightDescription(fontSize: CGFloat? = 16, heightInit: CGFloat, widthInit: CGFloat, description: String!, font: UIFont) -> CGRect {
    let sizeDescriptionInit = CGSize(width: widthInit, height: heightInit)
    let attributes = [NSAttributedString.Key.font: font]
    let estimateFrame = NSString(string:  description).boundingRect(with: sizeDescriptionInit, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
    
    return estimateFrame
}


// MARK: get type payment method
func getTypePaymentMethod(type: Int) -> String {
    var str: String = ""
    switch type {
    case 0: // tiền mặt
        str = "Tiền mặt"
    case 1: // thanh toán online
        str = "Thanh toán online"
    default:
        break
    }
    
    return str
}

// MARK: check camera
func prepareHandleCamera() -> Bool {
    var result: Bool = false
    let cameraMediaType = AVMediaType.video
    let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
    
    switch cameraAuthorizationStatus {
    case .denied:
        print("Denied access to \(cameraMediaType)")
        result = false
    case .authorized:
        print("authorized access to \(cameraMediaType)")
        result = true
    case .restricted:
        print("restricted access to \(cameraMediaType)")
        result = false
        
    case .notDetermined:
        // Prompting user for the permission to use the camera.
        AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
            if granted {
                print("Granted access to \(cameraMediaType)")
                result = true
            } else {
                print("Denied access to \(cameraMediaType)")
                result = false
            }
        }
    }
    return result
}

// MARK: GOTO SETTING OPEN CAMMERA ALERT
func showPopupGotoSetting(viewController: UIViewController, title: String = "Ứng dụng cần sử dụng camera", message: String = "") {
    let settingAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let gotoSettingAction = UIAlertAction(title: "Cài đặt", style: .default, handler: { _ in
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.openURL(url)
        }
    })
    let cancelAction = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
    
    settingAlert.addAction(gotoSettingAction)
    settingAlert.addAction(cancelAction)
    
    viewController.present(settingAlert, animated: true) {
        viewController.dismisAlert(alert: settingAlert)
    }
}



// MARK: fix show alert action sheet for ipad
func fixShowAlertActionSheetForIpad(alert: UIAlertController, viewController: UIViewController) {
    // fix alert with actionSheet on ipad
    if let popoverController = alert.popoverPresentationController {
        popoverController.sourceView = viewController.view
        popoverController.sourceRect = CGRect(x: viewController.view.bounds.midX, y: UIScreen.main.bounds.height, width: 0, height: 0)
    }
}

// convert time interval to string
func doubleToStringDate(double: Double, format: String) -> String {
    let date = Date(timeIntervalSince1970: double)
    let dateFormatter = DateFormatter()
//    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
}

func stringDateToDouble(string: String, format: String) -> Double {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = format
    let date = dateFormatter.date(from: string)
    let time = date?.timeIntervalSince1970
    
    return time ?? 0
}

// MARK: replace string to string
public func replaceString(string: String, regEx: String = "<[^>]+>") -> String? {
    let str = string.replacingOccurrences(of: regEx, with: "", options: .regularExpression, range: nil)
    
    return str
}
