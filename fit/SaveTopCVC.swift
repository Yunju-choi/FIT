//
//  SaveTopCVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 3..
//  Copyright © 2017년 SOPT. All rights reserved.
//

import UIKit

class SaveTopCVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    let labelDate = ["2017.1.6","2017.1.6","2017.1.6","2017.1.6", "2017.1.6", "2017.1.6"]
    let labelName = ["66걸즈, 청바지","믹스앤믹스, 니트","멀티팝, 무지맨투맨","플레이어, 나이키티셔츠","프롬비기닝, 원피스", "신화, 짱"]
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SaveTopCell
        
        cell.saveImage?.image = self.imageArray[indexPath.row]
        cell.saveDate?.text = self.labelDate[indexPath.row]
        cell.saveName?.text = self.labelName[indexPath.row]

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "showDatail", sender: self)
        let svc = storyboard?.instantiateViewController(withIdentifier: "SaveDetailVC") as! SaveDetailVC
        navigationController?.pushViewController(svc, animated: true)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = storyboard?.instantiateViewController(withIdentifier: "SaveDetailVC") as! SaveDetailVC
        navigationController?.pushViewController(svc, animated: true)
    }
    */
    
    
}
