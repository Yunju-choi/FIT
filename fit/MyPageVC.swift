//
//  MyPageVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 3..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class MyPageVC : UIViewController {
    
    @IBAction func moveSaveFit(_ sender: AnyObject) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "SaveFitVC") as? SaveFitVC{
            navigationController?.pushViewController(svc, animated: true)
            //present(svc, animated: false)
        }
    }
 
    
}
