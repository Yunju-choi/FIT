//
//  ToggleImageButton.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class ToggleImageButton : ToggleButton{
    
    static let TOPBUTTON_CHECKED = "topButton_check"
    static let TOPBUTTON = "topButton"
    static let BOTTOMBUTTON_CHECKED = "bottomButton_check"
    static let BOTTOMBUTTON = "bottomButton"
    static let DANBULBUTTON_CHECKED = "danbulButton_check"
    static let DANBULBUTTON = "danbulButton"
    
    internal var trueImg : UIImage?
    internal var falseImg: UIImage?
    
    func setToggleImages(_ trueImgName: String?, falseImgName: String?) {
        trueImg = UIImage(named: trueImgName!)
        falseImg = UIImage(named: falseImgName!)
    }
    
    override func setButtonChecked(_ check: Bool) {
        if check {
            self.setImage(trueImg, for: UIControlState())
            self.checked = true
        } else {
            self.setImage(falseImg, for: UIControlState())
            self.checked = false
        }
    }
    /*
    var checkImg = false
    
    var unselectedImg = UIImage(named: "femaleButton")
    var selectedImg = UIImage(named:"femaleButton_check")
    
    override func setBtnClickEvent() {
        self.addTarget(self, action: #selector(ToggleImageButton.touchImageBtn(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func touchImageBtn(_ sender: ToggleImageButton) {
        if(checkImg){
            self.setImage(unselectedImg, for: UIControlState())
            checkImg = false
        }
        else{
            self.setImage(selectedImg, for: UIControlState())
            checkImg = true
        }
    }
    */
}
