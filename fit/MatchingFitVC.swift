//
//  MatchingFitVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 5..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class MatchingFitVC : UIViewController, NetworkCallback {
    
    @IBOutlet var saveFitImg: UIView!
    @IBOutlet var fitImgVIew: UIImageView!
    
    @IBOutlet var topView: UIView!
    @IBOutlet var middleView: UIView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var topLine: UIView!
    @IBOutlet var middleLine: UIView!
    @IBOutlet var bottomLine: UIView!
    
    @IBOutlet var txtTopMiddle: UILabel!
    @IBOutlet var txtBottomMiddle: UILabel!
    
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
    
    @IBOutlet var saveInfoView: UIView!
    @IBOutlet var saveTitle: UITextField!
    
    
    var originTopCenterY: CGFloat = 0
    var originBottomCenterY: CGFloat = 0
    
    var tagIndex = 0
    var kind = 0
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white

        let ud = UserDefaults.standard
        
        saveInfoView.isHidden = true
        loadSizeData()
        
        setKeyboardSetting()
        hideKeyboardWhenTappedAround()

        originTopCenterY = topView.center.y
        originBottomCenterY = bottomView.center.y
        
        switch tagIndex {
        case 0:
            bottomView.isUserInteractionEnabled = false
            bottomView.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
            bottomLine.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
            kind = 1 // 상의
        case 1:
            topView.isUserInteractionEnabled = false
            topView.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
            topLine.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
            kind = 2 // 하의
        case 2:
            kind = 3 // 단벌
        default:
            break
        }
        
        txtTopMiddle.text = ud.string(forKey: "myTopData")
        txtBottomMiddle.text = ud.string(forKey: "myBottomData")
        
        //let image = UIImage(view: saveFitImg)
        //testImg.image = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadSizeData()
    }
    
    @IBAction func top(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: topView)
        if let view = recognizer.view {
            
            let movedPoint = CGPoint(x:view.center.x, y:view.center.y + translation.y)
            if movedPoint.y < middleView.center.y && movedPoint.y >= originTopCenterY {
                view.center = CGPoint(x:view.center.x,
                                      y:view.center.y + translation.y)
                topLine.frame.origin = CGPoint(x: middleLine.frame.origin.x, y: view.center.y)
                let topToMiddle = Int(middleView.center.y - view.center.y)
                txtTopMiddle.text = "\(topToMiddle)"
            }
        }
        
        recognizer.setTranslation(CGPoint.zero, in: topView)
        
        let velocity = recognizer.velocity(in: topView)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 200
        
        let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
        var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                                 y:recognizer.view!.center.y + (velocity.y * slideFactor))
        
        finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
        finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
    }
    
    @IBAction func middle(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: middleView)
        if let view = recognizer.view {
            
            let movedPoint = CGPoint(x:view.center.x, y:view.center.y + translation.y)
            if movedPoint.y < bottomView.center.y && movedPoint.y >= topView.center.y {
                view.center = CGPoint(x:view.center.x,
                                      y:view.center.y + translation.y)
                middleLine.frame.origin = CGPoint(x: middleLine.frame.origin.x, y: view.center.y)
                let middleToBottom = Int(bottomView.center.y - view.center.y)
                txtBottomMiddle.text = "\(middleToBottom)"
            }
        }
        
        recognizer.setTranslation(CGPoint.zero, in: middleView)
        
        let velocity = recognizer.velocity(in: middleView)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 200
        
        let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
        var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                                 y:recognizer.view!.center.y + (velocity.y * slideFactor))
        finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
        finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
    }

    @IBAction func bottom(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: bottomView)
        if let view = recognizer.view {
            
            let movedPoint = CGPoint(x:view.center.x, y:view.center.y + translation.y)
            if movedPoint.y < originBottomCenterY && movedPoint.y >= middleView.center.y {
                view.center = CGPoint(x:view.center.x,
                                      y:view.center.y + translation.y)
                bottomLine.frame.origin = CGPoint(x: bottomLine.frame.origin.x, y: view.center.y)
                let middleToBottom = Int(bottomView.center.y - view.center.y)
                txtBottomMiddle.text = "\(middleToBottom)"
            }
        }
        
        recognizer.setTranslation(CGPoint.zero, in: bottomView)
        
        let velocity = recognizer.velocity(in: bottomView)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 200
        
        let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
        var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                                 y:recognizer.view!.center.y + (velocity.y * slideFactor))
        finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
        finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)

    }
    
    func loadSizeData() {
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
    
    @IBAction func finishMatching(_ sender: AnyObject) {
        saveInfoView.isHidden = false
        
        let saveImg = UIImage(view:saveFitImg)
        fitImgVIew.image = saveImg
        
        topView.isUserInteractionEnabled = false
        topView.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
        topLine.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
        
        middleView.isUserInteractionEnabled = false
        middleView.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
        middleLine.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
        
        bottomView.isUserInteractionEnabled = false
        bottomView.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
        bottomLine.backgroundColor = UIColor(hex: 0xF7C6CD, alpha: 1.0)
    }
    
    @IBAction func saveMatchingFit(_ sender: AnyObject) {
        let model = SaveFitModel(self)
        let ud = UserDefaults.standard

        if (saveTitle.text?.isEmpty)! {
            simpleAlert(title: "제목을 적어주세요", msg: "")
        }
        else if(kind == 1) { // 상의
            //let kindData = gsno(String(kind))
            let total = clothTop.text!
            let shoulder = clothShoulder.text!
            let arm = clothArm.text!
            let uid = ud.string(forKey: "user_id")!
            let info = saveTitle.text!
            if let image = fitImgVIew.image {
                let imageData = UIImageJPEGRepresentation(image, 0.5)
                model.saveTop(kind: "1", total: total, shoulder: shoulder, arm: arm, imageData: imageData, uid: uid, info: info)
                //model.saveTopPlease(total: total, shoulder: shoulder, arm: arm, imageData: imageData, uid: uid, info: info)

            }
        }
        else if(kind == 2) { // 하의
            let total = gsno(clothTop.text)
            let uid = gsno(ud.string(forKey: "user_id"))
            let info = gsno(saveTitle.text)
            if let image = fitImgVIew.image {
                let imageData = UIImageJPEGRepresentation(image, 0.5)
                model.saveBottom(kind: "2", total: total, imageData: imageData, uid: uid, info: info)
            }

        }
        else if(kind == 3) { // 단벌
            let total = gsno(clothTop.text)
            let shoulder = gsno(clothShoulder.text)
            let arm = gsno(clothArm.text)
            let uid = gsno(ud.string(forKey: "user_id"))
            let info = gsno(saveTitle.text)
            if let image = fitImgVIew.image {
                let imageData = UIImageJPEGRepresentation(image, 0.5)
                model.saveOne(kind: "3", total: total, shoulder: shoulder, arm: arm, imageData: imageData, uid: uid, info: info)
            }
        }
        else {
            
        }
//        let model = PostModel(self)
//        let title = editTitle.text!
//        let content = editContent.text!
//        if let image = imgContent.image{
//            let imageData = UIImageJPEGRepresentation(image, 0.5) // (데이터로 바꿔준 이미지, 품질)
//            model.uploadPost(title: title, content: content, imageData: imageData)
//        }
    }
    
    func networkResult(resultData: Any, code: Int) {
        simpleAlert(title: "저장이 완료되었습니다.", msg: "")
        
    }
    
    @IBAction func restartSecondTab(_ sender: AnyObject) {
        
        navigationController?.popToRootViewController(animated: true)
        /*
        let mainSB = UIStoryboard(name: "Main", bundle: nil) // 로그인과 메인의 스토리보드가 달라서 이렇게 만들어준다.
        let vc = mainSB.instantiateViewController(withIdentifier: "MainTab") as! UITabBarController
        navigationController?.pushViewController(vc, animated: true)
        */
    }
}
