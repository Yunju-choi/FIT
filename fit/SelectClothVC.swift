//
//  SelectClothVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 1..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class SelectClothVC : UIViewController {
    
    @IBOutlet var imgClothDetail: UIImageView!
    
    @IBOutlet var myTop: UILabel!
    @IBOutlet var myBottom: UILabel!
    @IBOutlet var myTotal: UILabel!
    @IBOutlet var myArm: UILabel!
    @IBOutlet var myShoulder: UILabel!
    
    @IBOutlet var clothTop: UILabel!
    @IBOutlet var clothBottom: UILabel!
    @IBOutlet var clothTotal: UILabel!
    @IBOutlet var clothArm: UILabel!
    @IBOutlet var clothShoulder: UILabel!
    
    @IBOutlet var choiceCloth : [ToggleImageButton]!
    
    var currentBtn : ToggleImageButton?
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        choiceCloth[0].setToggleImages("topButton_check", falseImgName: "topButton")
        choiceCloth[1].setToggleImages("bottomButton_check", falseImgName: "bottomButton")
        choiceCloth[2].setToggleImages("danbulButton_check", falseImgName: "danbulButton")
        
        choiceCloth[0].addTarget(self, action: #selector(topButtonPressed(_:)), for: .touchUpInside)
        choiceCloth[1].addTarget(self, action: #selector(bottomButtonPressed(_:)), for: .touchUpInside)
        choiceCloth[2].addTarget(self, action: #selector(danbulButtonPressed(_:)), for: .touchUpInside)

        loadSizeData()
        //imgClothDetail.image = ud.object(forKey: "imgClothDetail")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadSizeData()
    }
    
    func topButtonPressed(_ sender : ToggleImageButton) {
        if currentBtn?.tag == sender.tag { //같은 버튼이면
            print("같은버튼")
            currentBtn?.setButtonChecked(true)
        } else { //다른버튼이면
            currentBtn?.setButtonChecked(false)
            sender.setButtonChecked(true)
            currentBtn = sender
        }

    }
    
    func bottomButtonPressed(_ sender : ToggleImageButton) {
        if currentBtn?.tag == sender.tag { //같은 버튼이면
            print("같은버튼")
            currentBtn?.setButtonChecked(true)
        } else { //다른버튼이면
            currentBtn?.setButtonChecked(false)
            sender.setButtonChecked(true)
            currentBtn = sender
        }

    }
    
    func danbulButtonPressed(_ sender : ToggleImageButton) {
        if currentBtn?.tag == sender.tag { //같은 버튼이면
            print("같은버튼")
            currentBtn?.setButtonChecked(true)
        } else { //다른버튼이면
            currentBtn?.setButtonChecked(false)
            sender.setButtonChecked(true)
            currentBtn = sender
        }

    }
    
    func loadSizeData () {
        let userDefault = UserDefaults.standard
        myTop.text = userDefault.string(forKey: "myTopData")
        myBottom.text = userDefault.string(forKey: "myBottomData")
        myTotal.text = userDefault.string(forKey: "myTotalData")
        myArm.text = userDefault.string(forKey: "myArmData")
        myShoulder.text = userDefault.string(forKey: "myShoulderData")
        
        clothTop.text = userDefault.string(forKey: "clothTopData")
        clothBottom.text = userDefault.string(forKey: "clothBottomData")
        clothTotal.text = userDefault.string(forKey: "clothTotalData")
        clothArm.text = userDefault.string(forKey: "clothArmData")
        clothShoulder.text = userDefault.string(forKey: "clothShoulderData")
    }
    
    
    @IBAction func nextView(_ sender: AnyObject) {
        if let tag = currentBtn?.tag {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "MatchingFitVC") as? MatchingFitVC {
                vc.tagIndex = tag
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            simpleAlert(title: "옷 종류를 선택해주세요", msg: "")
        }
    }
    
}
