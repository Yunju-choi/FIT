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
        
        hideKeyboardWhenTappedAround()


    }
    
    @IBAction func checkID(_ sender: AnyObject) {
        let id = editID.text!
        
        let model = UserModel(self)
        model.checkID(id: id)
    }
    
    @IBAction func checkNickname(_ sender: AnyObject) {
        let nickname = editNickname.text!
        
        let model = UserModel(self)
        model.checkNickname(nickname: nickname)
    }
    @IBAction func clickTextField(_ sender: AnyObject) {
        showKeyboard()
    }
    
    @IBAction func endTextFiled(_ sender: AnyObject) {
        dismissKeyboard()
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
        switch code {
        case 0: // 회원가입
            let msg = resultData as! String
            if(msg == "success"){
                dismiss(animated: true)
            } else {
                simpleAlert(title: "회원가입실패", msg: "")
            }
            break
            
        case 1: // id 중복체크
            let msg = resultData as? Int
            if(gino(msg) == 3){
                simpleAlert(title: "중복된 아이디가 있습니다", msg: "")
                editID.text = ""
            } else {
                simpleAlert(title: "사용 가능한 아이디입니다", msg: "")
            }
            break
            
        case 2: // 닉네임 중복체크
            let msg = resultData as? Int
            if(gino(msg) == 3) {
                simpleAlert(title: "중복된 닉네임이 있습니다.", msg: "")
                editNickname.text = ""
            } else {
                simpleAlert(title: "사용 가능한 아이디입니다", msg: "")
            }
            break
        default :
            print("")
        }
    }
}

/*
extension JoinVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        let limit = 10
        return newLength <= limit
        
    }
}
*/
