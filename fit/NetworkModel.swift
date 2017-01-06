//
//  NetworkModel.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

class NetworkModel {
    
    //aws EC2 인스턴스의 주소
    internal let baseURL = "http://52.205.252.157:3000"
    
    var view: NetworkCallback
    
    init(_ view: NetworkCallback) {
        self.view = view
    }
    
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
    
    func gfno(_ value: Float?) -> Float {
        if let value_ = value {
            return value_
        } else {
            return 0
        }
    }
    
    func gdno(_ value: Double?) -> Double {
        if let value_ = value {
            return value_
        } else {
            return 0
        }
    }
}
