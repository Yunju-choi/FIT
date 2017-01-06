//
//  LoginVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import FacebookCore

class LoginVC : UIViewController, NetworkCallback {
    
    @IBOutlet var editID: UITextField!
    @IBOutlet var editPW: UITextField!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    var model : UserModel?
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        model = UserModel(self)
        
        
        setKeyboardSetting()

        self.editID.delegate = self
        self.editPW.delegate = self
        
    }
    
    @IBAction func btnJoin(_ sender: AnyObject) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinVC{
            
            present(svc, animated: true)
        }
    }
    
    @IBAction func btnLogin(_ sender: AnyObject) {
        let id = editID.text!
        let pw = editPW.text!
        
        if id.isEmpty {
            simpleAlert(title: "입력 오류", msg: "이메일을 입력해주세요.")
        } else if pw.isEmpty {
            simpleAlert(title: "입력 오류", msg: "비밀번호를 입력해주세요.")
        } else {
            //let model = UserModel(self)
            model?.login(id: id, pw: pw)
        }
        
    }
    
    @IBAction func btnFacebook(_ sender: AnyObject) {
        if let token = FBSDKAccessToken.current() {
            self.model?.fetchFBProfile()
        } else {
            let loginManager = LoginManager()
            // publicProfile 과  email을 받아옴. 더 추가해도 됨~
            loginManager.logIn([ .publicProfile, .email], viewController: self) { loginResult in
                switch loginResult {
                case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                    self.loadingIndicator.startAnimating() // 정보 가져오기 전에
                    self.model?.fetchFBProfile() // 페이스북에서 로그인 정보 가져오는 것
                case .failed(let err):
                    print("로그인했을때")
                    print(err)
                    self.networkFailed()
                case .cancelled:
                    print("User cancelled login.")
                }
            }
        }
    }
    
    /*
    @IBAction func btnKakaotalk(_ sender: AnyObject) {
        loginModel?.fetchKakaoProfile()
    }
    
    @IBAction func kakaoShare(_ sender: AnyObject) {
        let text = KakaoTalkLinkObject.createLabel("테스트입니다.")
        let image = KakaoTalkLinkObject.createImage("https://s3.ap-northeast-2.amazonaws.com/noldam/sitter/certificate/pokemon1.png", width: 164, height: 198) // 보내고 싶은 이미지 url
        let appAction = KakaoTalkLinkAction.createAppAction(.IOS, devicetype: .phone, marketparamString: "itms-apps://itunes.apple.com/kr/app/noldam/id1137715307?mt=8", execparamString: "")! // 앱으로 연결하기
        let link = KakaoTalkLinkObject.createAppButton("눌러보세요!!", actions: [appAction])
        KOAppCall.openKakaoTalkAppLink([text!, image!, link!])
    }
     */
    
    func networkResult(resultData: Any, code: Int) {
        self.loadingIndicator.stopAnimating()
        
        if code == UserModel.CODE_FB_CB {
            let data = resultData as! UserModel.UserDataRequest.Response
            print(data)
        }
        
        /*
        else if code == UserModel.CODE_KT_CB {
            let data = resultData as! String
            print(data)
        }
        */
        
        else {
            let data = resultData as! Int
            print(data)
            if (data == 0 || data == 1) { // 사업자 0, 사용자 1, 실패 3
                let mainSB = UIStoryboard(name: "Main", bundle: nil) // 로그인과 메인의 스토리보드가 달라서 이렇게 만들어준다.
                let vc = mainSB.instantiateViewController(withIdentifier: "MainTab") as! UITabBarController
                
                //let nvc = vc.childViewControllers.first!
                //let pvc = nvc.childViewControllers.first! as! SelectModelVC
                //pvc.id = data.1
                
                //let secondNvc = vc.childViewControllers[1]
                //let secondFvc = secondNvc.childViewControllers.first! as! FitVC
                //secondFvc.id = editEmail.text
                
                //let thirdNvc = vc.childViewControllers[2]
                //let thirdFvc = thirdNvc.childViewControllers.first! as! MyPageVC
                
                
                present(vc, animated: true)
            } else {
                simpleAlert(title: "로그인 실패", msg: "아이디 또는 비밀번호가 일치하지 않습니다.")
            }
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        let limit = 10
        return newLength <= limit
        
    }
}
