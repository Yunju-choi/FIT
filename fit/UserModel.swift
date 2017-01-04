//
//  UserModel.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//


import Alamofire
import SwiftyJSON
import FacebookCore


class UserModel: NetworkModel {
    
    let ud = UserDefaults.standard
    
    // 페이스북 로그인
    static let CODE_FB_CB = 100
    //static let CODE_KT_CB = 101
    static let CODE_LOGIN = 200
    
    // 로그인
    func login(id: String, pw: String) {
        let params = [
            "id" : id,
            "password" : pw]
        
        Alamofire.request("\(baseURL)/sign/in", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { res in
            switch res.result {
            case .success :
                if let value = res.result.value {
                    let data = JSON(value)
                    print(data)
                    let result = self.gino(data["result"].int)
                    //let pokemon = self.gino(data["id"].int) // 서버에서 만들어준 id를 뿌림
                    //let tuple = (result, pokemon)
                    //self.view.networkResult(resultData: tuple, code: 0) // 매칭되는 경우 1, 매칭안되면 0값이 모내진다.
                    
                    self.ud.set(id, forKey: "user_id")
                    self.ud.synchronize()
                    self.view.networkResult(resultData: result, code: 0)
                }
            case .failure(let err) :
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    
    // 페이스북 로그인 시도
    func fetchFBProfile() {
        let connection = GraphRequestConnection()
        
        connection.add(UserDataRequest()) {
            (response: HTTPURLResponse?, result: GraphRequestResult<UserDataRequest>) in
            switch result {
            case .success(let graphResponse) :
                self.view.networkResult(resultData: graphResponse, code: UserModel.CODE_FB_CB)
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

    
    // 회원가입
    // 메소드는 각각의 요청을 의미한다.
    func signUp(id: String, nickname: String, pw:String, mail: String, check: Int) {
        
        let params = [
            "id" : id,
            "nickname" : nickname,
            "password" : pw,
            "mail" : mail,
            "check": check] as [String : Any]
        
        Alamofire.request("\(baseURL)/sign/up", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { res in
            switch res.result {
            case .success :
                self.view.networkResult(resultData: "", code: 0)
                break
            case .failure(let err) :
                print(err)
                self.view.networkFailed()
            }
        }
        
    }
}
