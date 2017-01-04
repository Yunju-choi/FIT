//
//  ContentModelVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class ContentModelVC : UIViewController {
    
    @IBOutlet var heightModel: UILabel!
    @IBOutlet var imgModel: UIImageView!
    
    var pageIndex : Int!
    var modelHeight : String!
    var imageFile : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heightModel.text = modelHeight
        self.imgModel.image = UIImage(named: self.imageFile)
    }
}
