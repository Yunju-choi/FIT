//
//  NetworkCallback.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

protocol NetworkCallback {
    func networkFailed()
    func networkResult(resultData: Any, code: Int)
}
