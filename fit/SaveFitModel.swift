//
//  SaveFitModel.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 6..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import Alamofire
import SwiftyJSON

class SaveFitModel : NetworkModel {
    
    func saveTop(kind: String, total: String, shoulder: String, arm: String, imageData: Data?, uid: String, info: String) {
        
        let url = "\(baseURL)/cloth/size_save"
        
        print("##saveTop Network##")
        print(kind)
        print(total)
        
        let kindData = kind.data(using: .utf8)!
        let totalData = total.data(using: .utf8)!
        let shoulderData = shoulder.data(using: .utf8)!
        let armData = arm.data(using: .utf8)!
        let uidData = uid.data(using: .utf8)!
        let infoData = info.data(using: .utf8)!
        
        print("@@data@@")
        print(kindData)
        print(totalData)
        
        if imageData == nil {
        } else {
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData!, withName: "mimg", fileName: "image.jpg", mimeType: "image/png")
                    multipartFormData.append(kindData, withName: "kind")
                    multipartFormData.append(totalData, withName: "total")
                    multipartFormData.append(shoulderData, withName: "shoulder")
                    multipartFormData.append(armData, withName: "arm")
                    multipartFormData.append(uidData, withName:"uid")
                    multipartFormData.append(infoData, withName:"info")
                },
                to: url,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseData { res in
                            switch res.result {
                            case .success:
                                DispatchQueue.main.async(execute: {
                                    self.view.networkResult(resultData: "", code: 0)
                                })
                            case .failure(let err):
                                print("upload Error : \(err)")
                                DispatchQueue.main.async(execute: {
                                    self.view.networkFailed()
                                })
                            }
                        }
                    case .failure(let err):
                        print("network Error : \(err)")
                        self.view.networkFailed()
                    }
            })
        }
    }
    
//    int kind,
//    float total,
//    varchar uid,
//    text info,
//    blob mimg
    func saveBottom(kind: String, total: String, imageData: Data?, uid: String, info: String) {
        
        let url = "\(baseURL)/cloth/size_save"
        
        let kindData = kind.data(using: .utf8)!
        let totalData = total.data(using: .utf8)!
        let uidData = uid.data(using: .utf8)!
        let infoData = info.data(using: .utf8)!
        
        if imageData == nil {
        } else {
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData!, withName: "mimg", fileName: "image.jpg", mimeType: "image/png")
                    multipartFormData.append(kindData, withName: "kind")
                    multipartFormData.append(totalData, withName: "total")
                    multipartFormData.append(uidData, withName:"uid")
                    multipartFormData.append(infoData, withName:"info")
                },
                to: url,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseData { res in
                            switch res.result {
                            case .success:
                                DispatchQueue.main.async(execute: {
                                    self.view.networkResult(resultData: "", code: 0)
                                })
                            case .failure(let err):
                                print("upload Error : \(err)")
                                DispatchQueue.main.async(execute: {
                                    self.view.networkFailed()
                                })
                            }
                        }
                    case .failure(let err):
                        print("network Error : \(err)")
                        self.view.networkFailed()
                    }
            })
        }
    }
    
//    int kind,
//    float total,
//    float shoulder,
//    float arm,
//    blob mimg,
//    varchar uid,
//    varchar info
    func saveOne(kind: String, total: String, shoulder: String, arm: String, imageData: Data?, uid: String, info: String) {
        
        let url = "\(baseURL)/cloth/size_save"
        
        let kindData = kind.data(using: .utf8)!
        let totalData = total.data(using: .utf8)!
        let shoulderData = shoulder.data(using: .utf8)!
        let armData = arm.data(using: .utf8)!
        let uidData = uid.data(using: .utf8)!
        let infoData = info.data(using: .utf8)!
        
        if imageData == nil {
        } else {
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData!, withName: "mimg", fileName: "image.jpg", mimeType: "image/png")
                    multipartFormData.append(kindData, withName: "kind")
                    multipartFormData.append(totalData, withName: "total")
                    multipartFormData.append(shoulderData, withName: "shoulder")
                    multipartFormData.append(armData, withName: "arm")
                    multipartFormData.append(uidData, withName:"uid")
                    multipartFormData.append(infoData, withName:"info")
                },
                to: url,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseData { res in
                            switch res.result {
                            case .success:
                                DispatchQueue.main.async(execute: {
                                    self.view.networkResult(resultData: "", code: 0)
                                })
                            case .failure(let err):
                                print("upload Error : \(err)")
                                DispatchQueue.main.async(execute: {
                                    self.view.networkFailed()
                                })
                            }
                        }
                    case .failure(let err):
                        print("network Error : \(err)")
                        self.view.networkFailed()
                    }
            })
        }
    }

    func saveTopPlease(total: String, shoulder: String, arm: String, imageData: Data?, uid: String, info: String) {
        
        let url = "\(baseURL)/ioscloth/ios_save"
        
        let totalData = total.data(using: .utf8)!
        let shoulderData = shoulder.data(using: .utf8)!
        let armData = arm.data(using: .utf8)!
        let uidData = uid.data(using: .utf8)!
        let infoData = info.data(using: .utf8)!
        
        if imageData == nil {
        } else {
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData!, withName: "mimg", fileName: "image.jpg", mimeType: "image/png")
                    multipartFormData.append(totalData, withName: "total")
                    multipartFormData.append(shoulderData, withName: "shoulder")
                    multipartFormData.append(armData, withName: "arm")
                    multipartFormData.append(uidData, withName:"uid")
                    multipartFormData.append(infoData, withName:"info")
                },
                to: url,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseData { res in
                            switch res.result {
                            case .success:
                                DispatchQueue.main.async(execute: {
                                    self.view.networkResult(resultData: "", code: 0)
                                })
                            case .failure(let err):
                                print("upload Error : \(err)")
                                DispatchQueue.main.async(execute: {
                                    self.view.networkFailed()
                                })
                            }
                        }
                    case .failure(let err):
                        print("network Error : \(err)")
                        self.view.networkFailed()
                    }
            })
        }
    }


}

//    func saveTop(title: String, content: String, imageData: Data?) {
//        
//        let url = "\(baseURL)/posts/"
//        
//        let titleData = title.data(using: .utf8)!
//        let contentsData = content.data(using: .utf8)!
//        
//        if imageData == nil {
//        } else {
//            Alamofire.upload(
//                multipartFormData: { multipartFormData in
//                    multipartFormData.append(imageData!, withName: "image", fileName: "image.jpg", mimeType: "image/png")
//                    multipartFormData.append(titleData, withName:"title")
//                    multipartFormData.append(contentsData, withName:"contents")
//                },
//                to: url,
//                encodingCompletion: { encodingResult in
//                    switch encodingResult {
//                    case .success(let upload, _, _):
//                        upload.responseData { res in
//                            switch res.result {
//                            case .success:
//                                DispatchQueue.main.async(execute: {
//                                    self.view.networkResult(resultData: "", code: 0)
//                                })
//                            case .failure(let err):
//                                print("upload Error : \(err)")
//                                DispatchQueue.main.async(execute: {
//                                    self.view.networkFailed()
//                                })
//                            }
//                        }
//                    case .failure(let err):
//                        print("network Error : \(err)")
//                        self.view.networkFailed()
//                    }
//            })
//        }
//    }
//}
