//
//  FitVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class FitVC : UIViewController {
    
    @IBOutlet var imgClothDetail: UIImageView!
    
    @IBOutlet var myTop: UILabel!
    @IBOutlet var myBottom: UILabel!
    @IBOutlet var myHeight: UILabel!
    @IBOutlet var myArm: UILabel!
    @IBOutlet var myShoulder: UILabel!
    
    @IBOutlet var clothTop: UITextField!
    @IBOutlet var clothBottom: UITextField!
    @IBOutlet var clothHeight: UITextField!
    @IBOutlet var clothArm: UITextField!
    @IBOutlet var clothShoulder: UITextField!
    
    @IBOutlet var clothStackView: UIStackView!
    
    // 포토 갤러리로 넘어가는거 구현
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardSetting()
        let userDefault = UserDefaults.standard
        myTop.text = userDefault.string(forKey: "myTopData")
        myBottom.text = userDefault.string(forKey: "myBottomData")
        myHeight.text = userDefault.string(forKey: "myTotalData")
        myArm.text = userDefault.string(forKey: "myArmData")
        myShoulder.text = userDefault.string(forKey: "myShoulderData")
        
        picker.allowsEditing = true // true로 바꾸면 이미지 크롭 가능
        picker.delegate = self // 딜리게이트구현. 지금처럼 하지 말고 extension 이용해서 딜리게이트 상속받기
        
        for view in clothStackView.arrangedSubviews {
            if view.subviews.count > 0 {
                print(view.subviews)
                if let tf = view.subviews[0] as? UITextField {
                    tf.delegate = self
                }
            }
            
        }
    }
    
    @IBAction func selectPhotoTap(_ sender: AnyObject) {
        present(picker, animated: true)
    }
    
   
    @IBAction func nextView(_ sender: AnyObject) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SelectClothVC") as? SelectClothVC {
//            let userDefault = UserDefaults.standard
//            userDefault.set(clothTop.text, forKey: "clothTopData")
//            userDefault.set(clothBottom.text, forKey: "clothBottomData")
//            userDefault.set(myTotal.text, forKey: "myTotalData")
//            userDefault.set(clothArm.text, forKey: "clothArmData")
//            userDefault.set(clothShoulder.text, forKey: "clothShoulderData")
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


// UIImagePickerControllerDelegate만 구현하면 오류뜸
extension FitVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    // 이미지 선택하려다 취소했을 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // 사진 선택 관련 딜리게이트
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("선택완료")
        // 새로운 이미지 프로퍼티를 만들어주고
        var newImage: UIImage
        
        //인자로 받은 info 딕셔너리 안에 만들어져 있는 거
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage{ // 크롭된 이미지
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage { // 크롭 안 된 원본 이미지
            newImage = possibleImage
        } else {
            return
        }
        
        imgClothDetail.image = newImage
        dismiss(animated: true, completion: nil) // present로 사진선택 들어왔기 때문에 dismiss 해주어야 함
    }
}

extension FitVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        let limit = 3
        return newLength <= limit

    }
}

