//
//  ToggleImageButton.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class ToggleImageButton : ToggleButton{
    
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
}
