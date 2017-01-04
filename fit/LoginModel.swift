//
//  LoginModel.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 31..
//  Copyright © 2016년 SOPT. All rights reserved.
//

/*
import Alamofire
import SwiftyJSON
import FacebookCore

class LoginModel : NetworkModel {
    static let CODE_FB_CB = 100
    static let CODE_KT_CB = 101
    static let CODE_LOGIN = 200
    
    // 페이스북 로그인 시도
    func fetchFBProfile() {
        let connection = GraphRequestConnection()
        
        connection.add(UserDataRequest()) {
            (response: HTTPURLResponse?, result: GraphRequestResult<UserDataRequest>) in
            switch result {
            case .success(let graphResponse) :
                self.view.networkResult(resultData: graphResponse, code: LoginModel.CODE_FB_CB)
            case .failed(let err) :
                print(err)
                self.view.networkFailed()
            }
        }
        connection.start()
    }
    

    // 페이스북 데이터 요청을 위한 구조체
    struct UserDataRequest: GraphRequestProtocol {
        struct Response: GraphResponseProtocol {
            
            // 페이스북에서 가져올 필요한 데이터를 적어준다.
            var id = ""
            var email = ""
            var name = ""
            var url = ""
            
            init(rawResponse: Any?) {
                if let data = rawResponse as? [String: Any] { // String과 어느 형태의 값이 같이 온다.
                    if let id = data["id"] {
                        self.id = id as! String
                    }
                    
                    if let email = data["email"] {
                        self.email = email as! String
                    }
                    
                    if let name = data["name"] {
                        self.name = name as! String
                    }
                    
                    if let url = (data["picture"] as? [String: [String: String]])?["data"]?["url"] {
                        self.url = url
                    }
                }
            }
        }
        
        public let graphPath = "me" // 친구면 friends라는 듯
        //public let parameters: [String:Any]? = ["fields" : "email, name, picture{url}"]
        public let parameters: [String:Any]? = ["fields" : "id, email, name, picture{url}"]
        public let accessToken: AccessToken? = AccessToken.current
        public let httpMethod: GraphRequestHTTPMethod = .GET
        public let apiVersion: GraphAPIVersion = GraphAPIVersion.defaultVersion
    }
    
    func fetchKakaoProfile() {
        let session: KOSession = KOSession.shared();
        if session.isOpen() {
            session.close()
        }
        session.open(completionHandler: {(error) in
            if error == nil {
                if session.isOpen() {
                    KOSessionTask.meTask{ (userData, error) in
                        if error == nil {
                            let user = (userData as! KOUser) // KOUser 안에 아이디?
                            let numID = user.id as Int
                            let id = "\(numID)"
                            self.view.networkResult(resultData: id, code: LoginModel.CODE_KT_CB)
                        } else {
                            print("Fetching Failed")
                        }
                    }
                } else {
                    print("2 - error : \(error.debugDescription)")
                    self.view.networkFailed()
                }
            } else {
                print("1 - error : \(error.debugDescription)")
                self.view.networkFailed()
            }
        })
    }
}
 */
