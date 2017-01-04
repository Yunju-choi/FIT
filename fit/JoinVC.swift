//
//  JoinVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class JoinVC : UIViewController, NetworkCallback {
    
    @IBOutlet var editID: UITextField!
    @IBOutlet var editNickname: UITextField!
    @IBOutlet var editEmail: UITextField!
    @IBOutlet var editPW: UITextField!
    @IBOutlet var editPWCheck: UITextField!
    @IBOutlet var radioUser: RadioButton!
    @IBOutlet var radioCOM: RadioButton!
    var radioGroup = RadioButtonsController()
    
    override func viewDidLoad() {
        radioGroup.addButton(radioUser)
        radioGroup.addButton(radioCOM)
    }
    
    @IBAction func checkID(_ sender: AnyObject) {
    }
    
    @IBAction func checkNickname(_ sender: AnyObject) {
    }
    
    @IBAction func btnCompleteJoin(_ sender: AnyObject) {
        let id = editID.text!
        let nickname = editNickname.text!
        let email = editEmail.text!
        let pw = editPW.text!
        let pwCheck = editPWCheck.text!
        let checkUser : Int!
        if(radioUser.isChecked) {
            checkUser = 1 // 사용자 1
        } else {
            checkUser = 0 // 사업자 0
        }
        
        if id.isEmpty {
            simpleAlert(title: "입력 오류", msg: "아이디를 입력해주세요.")
        } else if nickname.isEmpty {
            simpleAlert(title: "입력 오류", msg: "닉네임을 입력해주세요.")
        } else if email.isEmpty {
            simpleAlert(title: "입력 오류", msg: "이메일을 입력해주세요.")
        } else if pw.isEmpty {
            simpleAlert(title: "입력 오류", msg: "비밀번호를 입력해주세요.")
        } else if pw != pwCheck {
            simpleAlert(title: "입력 오류", msg: "비밀번호가 일치하지 않습니다.")
        }
        else  {
            let model = UserModel(self)
            model.signUp(id: id, nickname: nickname, pw:pw, mail: email, check: checkUser)
        }
    }
    
    func networkResult(resultData: Any, code: Int) {
        dismiss(animated: true)
    }
}
