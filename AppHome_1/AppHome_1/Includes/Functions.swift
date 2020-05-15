//
//  Functions.swift
//  EasyFood Shipper
//
//  Created by phuong on 12/25/19.
//  Copyright © 2019 EasyFoodShipper. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class MediaUpload {
    var url: URL?
    var uid: String?
    var thumbnail: String?
    var type: String?
    var image: UIImage?
    
    convenience init(url: URL?, uid: String?, thumbnail: String?, type: String?, image: UIImage?) {
        self.init()
        
        self.url = url
        self.uid = uid
        self.thumbnail = thumbnail
        self.type = type
        self.image = image
    }
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

// MARK: save image
func saveImageDocumentDirectory(image: UIImage, path: String){
    
    let fileManager = FileManager.default
    
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(path + ".jpg")
    
    
    
    print(paths)
    let imageData = image.jpegData(compressionQuality: 1)
    fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    
}

func appDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

// MARK: VALIDATE EMAIL
func validateEmail(enteredEmail:String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
    
}
// MARK: UPLOAD MULTI FILES WITH PARAMESTER via ALAMOFIRE
func uploadMultiFilesWithParams(parameters: [String: String], media: [MediaUpload], mediaKey: String, url: String, completionHandler: @escaping (PHSyncResponse)->()) {
    // each array media / get url if media is video and data if media is image
    Alamofire.upload(multipartFormData: { (multipartFormData) in
        for (key, value) in parameters {
            multipartFormData.append(value.data(using: .utf8)!, withName: key)
        }
        for val in media {
            if val.type == "image" {
                let imageData = val.image!.jpegData(compressionQuality: 0.6)
                multipartFormData.append(imageData!, withName: mediaKey, fileName: "imageIos.jpeg", mimeType: "image/jpeg")
            } else if val.type == "video" {
                multipartFormData.append(val.url!, withName: mediaKey)
            }
        }
    }, to: url) { (result) in
        switch result {
        case .success(let upload, _, _):
            upload.uploadProgress(closure: { (Progress) in
                print("Upload Progress: \(Progress.fractionCompleted)")
            })
            
            upload.responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completionHandler(JSON as! PHSyncResponse)
                }
            }

        case .failure(let encodingError):
            
            let result: PHSyncResponse = [
                "state": "error",
                "message": encodingError.localizedDescription
            ]
            completionHandler(result)
        }
    }
}

// MARK: ============= REQUEST SEVER WITH API via ALAMOFIRE ===========
func requestServerWithParamsViaAlamofire(url: String, params: Parameters?, completionHandler: @escaping (PHSyncResponse)->()) {
    Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (respond) in
        switch respond.result {
        case .success(_):
            if let respondData = respond.result.value as! PHSyncResponse? {
                completionHandler(respondData)
            }
        case .failure(let error):
            let result: PHSyncResponse = [
                "error": error,
                "message": error.localizedDescription
            ]
            completionHandler(result)
        }
    }
}
func requestServerWithParamsViaAlamofireURLendcoding(url: String, params: Parameters?, completionHandler: @escaping (PHSyncResponse)->()) {
    Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { (respond) in
        switch respond.result {
        case .success(_):
            if let respondData = respond.result.value as! PHSyncResponse? {
                completionHandler(respondData)
            }
        case .failure(let error):
            let result: PHSyncResponse = [
                "error": error,
                "message": error.localizedDescription
            ]
            completionHandler(result)
        }
    }
}
func requestServerWithParamsViaAlamofireURLendcodingResponseXML(url: String, params: Parameters?, completionHandler: @escaping (PHSyncResponse)->()) {
    Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default).responseString { response in
//        print("String:\(response.result.value)")
        switch(response.result) {
        case .success(_):
            if let data = response.result.value {
                let result: PHSyncResponse = [
                    "state": "success",
                    "data": data
                ]
                completionHandler(result)
            }
            
        case .failure(_):
//            print("Error message:\(response.result.error)")
            let result: PHSyncResponse = [
                "error": "error",
                "message": response.result.error ?? ""
            ]
            completionHandler(result)
            break
        }
    }
}

func requestServerWithParamsGetMethod(url: String, params: Parameters?, completionHandler: @escaping (PHSyncResponse)->()) {
    
    Alamofire.request(url, method: .get, parameters: params).responseJSON { (responseObject) -> Void in

            print(responseObject)

            if responseObject.result.isSuccess {
                if let data = responseObject.result.value {
                    let result: PHSyncResponse = [
                        "state": "success",
                        "data": data
                    ]
                    completionHandler(result)
                }
            }
            if responseObject.result.isFailure {
//                print("Error message:\(responseObject.result.error)")
                let result: PHSyncResponse = [
                    "error": "error",
                    "message": responseObject.result.error ?? ""
                ]
                completionHandler(result)
            }


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


// MARK: get symbol of country
func getSymbol(forCurrencyCode code: String) -> String? {
    let locale = NSLocale(localeIdentifier: code)
    return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
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
func stringDateToInt(string: String,format: String) -> Int
{
    let dfmatter = DateFormatter()
    dfmatter.dateFormat = format
    let date = dfmatter.date(from: string)
    let dateStamp:TimeInterval = date!.timeIntervalSince1970
    let dateSt:Int = Int(dateStamp)
    return dateSt
}

//MARK: convert Leng
// metter, kilometer
func meterToKm(metter: Double) -> Double
{
    var meterconvert = Double()
    if metter >= 1000
    {
        meterconvert = metter / 1000
    }
    else
    {
        meterconvert = metter
    }
    return metter
}
