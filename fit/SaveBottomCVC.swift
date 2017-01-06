//
//  SaveBottomCVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 3..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class SaveBottomCVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    //let items = ["snowflake1", "snowflake2", "snowflake3", "snowflake14"]
    
    //let imageArray = [UIImage(named: "snowflake1"),UIImage(named: "snowflake2"),UIImage(named: "snowflake3"),UIImage(named: "snowflake4")]
    
    let labelDate = ["2017.1.6","2017.1.6","2017.1.6","2017.1.6", "2017.1.6", "2017.1.6"]
    let labelName = ["윤주야","힘내","하트","하트","힘내", "윤주야"]
    let imageArray = [UIImage(named: "color1"),UIImage(named: "color2"),UIImage(named: "color3"),UIImage(named: "color4"), UIImage(named: "color5"), UIImage(named: "color6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.labelDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SaveBottomCell
        
        //cell.label1?.text = self.labelText1[indexPath.row]
        //cell.label2?.text = self.labelText2[indexPath.row]
        //cell.imgView?.image = self.imageArray[indexPath.row]
        
        //cell.titleLabel?.text = self.items[indexPath.row]
        
        cell.saveImage?.image = self.imageArray[indexPath.row]
        cell.saveDate?.text = self.labelDate[indexPath.row]
        cell.saveName?.text = self.labelName[indexPath.row]
        
        return cell
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showImage", sender: self)
    }
    */
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "showImage"{
     let indexPaths = self.collectionView!.indexPathsForSelectedItems!
     let indexPath = indexPaths[0] as NSIndexPath
     
     let vc = segue.destination as! CollectionDescVC
     
     vc.image = self.imageArray[indexPath.row]!
     vc.title = self.items[indexPath.row]
     
     
     }
     }
     */
}
