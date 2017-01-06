//
//  MyPageVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 3..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class MyPageVC : UIViewController {
    
    var myModelImage = Array<String>()

    
    @IBOutlet var myModel: UIImageView!
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var armLabel: UILabel!
    @IBOutlet var shoulderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        loadSizeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadSizeData()
    }
    
    func loadSizeData() {
        let ud = UserDefaults.standard

        self.myModelImage.append(contentsOf: ["female145_guide", "female150_guide", "female155_guide" , "female160_guide" , "female165_guide" , "female170_guide"])
        let index = ud.integer(forKey: "index")
        self.myModel.image = UIImage(named: myModelImage[index])
        self.topLabel.text = ud.string(forKey: "myTopData")
        self.bottomLabel.text = ud.string(forKey: "myBottomData")
        self.totalLabel.text = ud.string(forKey: "myTotalData")
        self.armLabel.text = ud.string(forKey: "myArmData")
        self.shoulderLabel.text = ud.string(forKey: "myShoulderData")
    }
    
    @IBAction func moveSaveFit(_ sender: AnyObject) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "SaveFitVC") as? SaveFitVC{
            navigationController?.pushViewController(svc, animated: true)
            //present(svc, animated: false)
        }
    }
 
    
}
