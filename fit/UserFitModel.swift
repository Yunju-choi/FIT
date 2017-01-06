//
//  UserFitModel.swift
//  fit
//
//  Created by  noldam on 2017. 1. 4..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import Alamofire
import SwiftyJSON

class UserFitModel: NetworkModel {
    
    let ud = UserDefaults.standard
    
    //사용자 치수 저장
    func saveUserFit(ufvo: UserFitVO) {
        let params : [String:Any] = [
            "top" : ufvo.upper,
            "bottom" : ufvo.lower,
            "shoulder" : ufvo.shoulder,
            "arm" : ufvo.arm,
            "total" : ufvo.total,
            "uid" : ufvo.uid]
        
        for i in params {
            print("insert")
            print(i)
        }
        
        
        Alamofire.request("\(baseURL)/size/insert_size", method: .post, parameters: params, encoding: JSONEncoding.default).response{
            res in
            switch self.gino(res.response?.statusCode){
            case 200:
                let sModel = SessionModel()
                sModel.setUserFit(ufvo: ufvo) // 사용자의 치수 정보가 여기서 저장. 저장값
                self.view.networkResult(resultData: "", code: 0)
                break
            default:
                print("실패")
                break
            }
        }
        
    }
    
    func modifyUserFit(ufvo: UserFitVO) {
        let params : [String:Any] = [
            "top" : ufvo.upper,
            "bottom" : ufvo.lower,
            "shoulder" : ufvo.shoulder,
            "arm" : ufvo.arm,
            "total" : ufvo.total,
            "uid" : ufvo.uid]
        
        for i in params {
            print("update")
            print(i)
        }
        
        
        Alamofire.request("\(baseURL)/size/update_size", method: .post, parameters: params, encoding: JSONEncoding.default).response{
            res in
            switch self.gino(res.response?.statusCode){
            case 200:
                let sModel = SessionModel()
                sModel.setUserFit(ufvo: ufvo) // 사용자의 치수 정보가 여기서 저장. 저장값
                self.view.networkResult(resultData: "", code: 0)
                break
            default:
                print("실패")
                break
            }
        }
        
    }
    
    func searchUserFit(ufvo: UserFitVO) {
        let params : [String:Any] = [
            "uid" : ufvo.uid]
        
        for i in params {
            print("update")
            print(i)
        }
        
        
        Alamofire.request("\(baseURL)/size/search_size", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON{
            res in
            switch res.result {
            case .success :
                if let value = res.result.value {
                    let data = JSON(value)
                    print(data)
                    let result = self.gsno(data["result"].string)
                    print("result")
                    print(result)
                    if result == "0" {
                        self.saveUserFit(ufvo: ufvo)
                    } else {
                        self.modifyUserFit(ufvo: ufvo)
                    }
                }
            case .failure(let err) :
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    
    
}

