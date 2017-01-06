//
//  MySizeVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 31..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class MySizeVC : UIViewController, NetworkCallback {
    
    var modelHeight = Array<String>()
    var imgModel = Array<String>()
    var arrayIndex : Int!
    var size = [["55","70","145","51","42"], ["55","70","150","51","43"], ["60","75","155","57","44"], ["65","75","160","60","44"], ["65","80","165","60","45"], ["67","85","170","63","47"]]

    @IBOutlet var myHeight: UILabel!
    @IBOutlet var myModel: UIImageView!
    
    @IBOutlet var mySizeStackView: UIStackView!
    
    var topLen: Float!
    var bottomLen: Float!
    var totalLen: Float!
    var armLen: Float!
    var shoulderLen: Float!

    //var height : String!
    //var imageFile : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        
        setKeyboardSetting()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.imgModel.append(contentsOf: ["female145_notify", "female150_notify", "female155_notify" , "female160_notify" , "female165_notify" , "female170_notify"])
        self.modelHeight.append(contentsOf: ["145", "150", "155" , "160" , "165" , "170"])
        
        ud.set(arrayIndex, forKey: "index")
        self.myModel.image = UIImage(named: imgModel[arrayIndex])
        self.myHeight.text = modelHeight[arrayIndex]
        
        for view in mySizeStackView.arrangedSubviews {
            if view.subviews.count > 0 {
                if let tf = view.subviews[0] as? UITextField {
                    tf.delegate = self
                }
            }
            
        }
        
        for view in mySizeStackView.arrangedSubviews {
            if view.subviews.count > 0 {
                if let tf = view.subviews[0] as? UITextField {
                    switch tf.tag {
                    case 0:
                        tf.text = size[arrayIndex][0]
                    case 1:
                        tf.text = size[arrayIndex][1]
                    case 2:
                        tf.text = size[arrayIndex][2]
                    case 3:
                        tf.text = size[arrayIndex][3]
                    case 4:
                        tf.text = size[arrayIndex][4]
                    default:
                        break
                    }
                }
            }
        }
    }
        
    @IBAction func btnCompleteSize(_ sender: AnyObject) {
        let model = UserFitModel(self)
        
        for view in mySizeStackView.arrangedSubviews {
            if view.subviews.count > 0 {
                if let tf = view.subviews[0] as? UITextField {
                    switch tf.tag {
                    case 0:
                        topLen = gfno(Float(tf.text!))
                    case 1:
                        bottomLen = gfno(Float(tf.text!))
                    case 2:
                        totalLen = gfno(Float(tf.text!))
                    case 3:
                        armLen = gfno(Float(tf.text!))
                    case 4:
                        shoulderLen = gfno(Float(tf.text!))
                    default:
                        break
                    }
                }
            }
        }
        
        let ufvo = UserFitVO(
            upper: topLen,
            lower: bottomLen,
            shoulder: shoulderLen,
            arm: armLen,
            total: totalLen,
            uid: gsno(UserDefaults.standard.string(forKey: "user_id")))
        
        model.searchUserFit(ufvo: ufvo)
    }
    
    func networkResult(resultData: Any, code: Int) {
        //navigationController?.popToRootViewController(animated: true)
        //tabBarController.
        simpleAlert(title: "사이즈 측정 완료!", msg: "다음 단계 진행 가능~")
    }
}

extension MySizeVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        let limit = 3
        return newLength <= limit
    }
}

