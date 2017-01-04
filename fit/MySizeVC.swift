//
//  MySizeVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 31..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class MySizeVC : UIViewController {
    
    var modelHeight = Array<String>()
    var imgModel = Array<String>()
    var arrayIndex : Int!
    var size = [["55","70","145","51","42"], ["55","70","150","51","43"], ["60","75","155","57","44"], ["65","75","160","60","44"], ["65","80","165","60","45"], ["67","85","170","63","47"]]

    @IBOutlet var myHeight: UILabel!
    @IBOutlet var myModel: UIImageView!
    
    @IBOutlet var topLen: PickerInputLabel!
    @IBOutlet var bottomLen: PickerInputLabel!
    @IBOutlet var totalLen: PickerInputLabel!
    @IBOutlet var armLen: PickerInputLabel!
    @IBOutlet var shoulderLen: PickerInputLabel!
    //var height : String!
    //var imageFile : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgModel.append(contentsOf: ["female145_guide", "female150_guide", "female155_guide" , "female160_guide" , "female165_guide" , "female170_guide"])
        self.modelHeight.append(contentsOf: ["145", "150", "155" , "160" , "165" , "170"])
        
        self.myModel.image = UIImage(named: imgModel[arrayIndex])
        self.myHeight.text = modelHeight[arrayIndex]
        
        topLen.initPickerInput(dataSource: ["0","1","2","3","4","5","6","7","8","9"])
        bottomLen.initPickerInput(dataSource: ["0","1","2","3","4","5","6","7","8","9"])
        totalLen.initPickerInput(dataSource: ["0","1","2","3","4","5","6","7","8","9"])
        armLen.initPickerInput(dataSource: ["0","1","2","3","4","5","6","7","8","9"])
        shoulderLen.initPickerInput(dataSource: ["0","1","2","3","4","5","6","7","8","9"])
        
        topLen.text = size[arrayIndex][0]
        bottomLen.text = size[arrayIndex][1]
        totalLen.text = size[arrayIndex][2]
        armLen.text = size[arrayIndex][3]
        shoulderLen.text = size[arrayIndex][4]
    }
        
    @IBAction func btnCompleteSize(_ sender: AnyObject) {
        let userDefault = UserDefaults.standard
        userDefault.set(topLen.text, forKey: "myTopData")
        userDefault.set(bottomLen.text, forKey: "myBottomData")
        userDefault.set(totalLen.text, forKey: "myTotalData")
        userDefault.set(armLen.text, forKey: "myArmData")
        userDefault.set(shoulderLen.text, forKey: "myShoulderData")
        simpleAlert(title: "사이즈 측정 완료!", msg: "다음 단계 진행 가능~")
    }

}
