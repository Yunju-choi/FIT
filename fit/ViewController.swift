//
//  ViewController.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    
    @IBOutlet var btnMale: ToggleButton!
    @IBOutlet var btnFemale: ToggleButton!
    @IBOutlet var imgBtnMale: ToggleImageButton!
    @IBOutlet var imgBtnFemale: ToggleImageButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnMale.clickedColor = UIColor.blue
        btnFemale.clickedColor = UIColor.orange
        imgBtnMale.unselectedImg = UIImage(named:"ic_male")
        imgBtnMale.selectedImg = UIImage(named:"ic_male_check")
        imgBtnFemale.unselectedImg = UIImage(named:"ic_female")
        imgBtnFemale.selectedImg = UIImage(named:"ic_female_check")
        
    }
    
    @IBAction func clickedMaleBtn(_ sender: AnyObject) {
        btnFemale.backgroundColor=btnFemale.unclickedColor
        btnFemale.check=false
    }
    
    @IBAction func clickedFemaleBtn(_ sender: AnyObject) {
        btnMale.backgroundColor=btnMale.unclickedColor
        btnMale.check=false
    }
    
    @IBAction func clickedMaleImg(_ sender: AnyObject) {
        imgBtnFemale.setImage(imgBtnFemale.unselectedImg, for: UIControlState())
        imgBtnFemale.checkImg=false
    }
    
    @IBAction func clickedFemaleImg(_ sender: AnyObject) {
        imgBtnMale.setImage(imgBtnMale.unselectedImg, for: UIControlState())
        imgBtnMale.checkImg=false
    }

    */
 
}

