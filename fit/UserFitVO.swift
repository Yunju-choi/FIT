//
//  UserFitVO.swift
//  fit
//
//  Created by  noldam on 2017. 1. 4..
//  Copyright © 2017년 SOPT. All rights reserved.
//

class UserFitVO {
    var upper : Float!
    var lower : Float!
    var shoulder : Float!
    var arm : Float!
    var total : Float!
    var uid = ""
    
    init() {}
    
    init(upper: Float, lower: Float, shoulder: Float, arm: Float, total: Float, uid: String) {
        self.upper = upper
        self.lower = lower
        self.shoulder = shoulder
        self.arm = arm
        self.total = total
        self.uid = uid
    }
}
