//
//  SessionModel.swift
//  fit
//
//  Created by  noldam on 2017. 1. 4..
//  Copyright © 2017년 SOPT. All rights reserved.
//

//세션을 관리하는 모델

class SessionModel {
    
    init() {}
    
    var ufvo = UserFitVO()
    let ud = UserDefaults.standard
    
    func gsno(_ value: String?) -> String {
        if let value_ = value {
            return value_
        } else {
            return ""
        }
    }
    
    func gino(_ value: Int?) -> Int {
        if let value_ = value {
            return value_
        } else {
            return 0
        }
    }
    
    func setUserFit(ufvo: UserFitVO) {
        ud.set(ufvo.upper, forKey: "myTopData")
        ud.set(ufvo.lower , forKey: "myBottomData")
        ud.set(ufvo.total, forKey: "myTotalData")
        ud.set(ufvo.arm, forKey: "myArmData")
        ud.set(ufvo.shoulder, forKey: "myShoulderData")
    }
    
    func getUserFit() -> UserFitVO {
        let ufvo = UserFitVO(
            upper: ud.float(forKey: "myTopData"),
            lower: ud.float(forKey: "myBottomData"),
            shoulder: ud.float(forKey: "myShoulderData"),
            arm: ud.float(forKey: "myArmData"),
            total: ud.float(forKey: "myTotalData"),
            uid: gsno(ud.string(forKey : "user_id")))
        return ufvo
    }
    
    func getUserID() -> String {
        return gsno(ud.string(forKey: "user_id"))
    }
    
    func isFitDataExist() -> Bool {
        return ud.string(forKey: "myTopData") != nil // 저장되어있으면 true
    }
}
