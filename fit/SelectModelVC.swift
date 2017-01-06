//
//  SelectModelVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 29..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class SelectModelVC : UIViewController {
    
    var index : Int!
    var height : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    @IBAction func clickFemaleButton(_ sender: AnyObject) {
    }
    
    @IBAction func clickMaleButton(_ sender: AnyObject) {
        simpleAlert(title: "앗! 준비중입니다", msg: "남자모델 구해오는 중")
        //femaleButton.setImage(femaleButton.unselectedImg, for: UIControlState())
        //femaleButton.checkImg = false
    }
    
    @IBAction func btnStart(_ sender: AnyObject) {
        
        self.index = getCurrentIndex()
        
        let ud = UserDefaults.standard
        ud.string(forKey: "user_id")
        
        if let pvc = childViewControllers.first as? SelectFemaleModelPVC {
            self.height = pvc.pageHeight[self.index]
        }
        
        if let svc = storyboard?.instantiateViewController(withIdentifier: "MySizeVC") as? MySizeVC{
            svc.arrayIndex = self.index
            navigationController?.pushViewController(svc, animated: true)
        }
        
        
    }
    
    func getCurrentIndex() -> Int {
        if let pvc = childViewControllers.first as? SelectFemaleModelPVC {
          //  pvc.pageHeight[index]
            if let cvc = pvc.viewControllers?.first as? ContentModelVC {
                return cvc.pageIndex
            }
        }
        return 0
    }
    
}
