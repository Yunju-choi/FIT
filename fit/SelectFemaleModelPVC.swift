//
//  SelectModelPVC.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import UIKit

class SelectFemaleModelPVC :  UIPageViewController, UIPageViewControllerDataSource {
    
    var pages = [UIViewController]()
    var pageImages = Array<String>()
    var pageHeight = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self

        self.pageHeight.append(contentsOf: ["145" , "150", "155" , "160" , "165" , "170"])
        self.pageImages.append(contentsOf: ["female145_size", "female150_size", "female155_size" , "female160_size" , "female165_size" , "female170_size"])
        
        let startVC = self.viewControllerAtIndex(index : 0) as ContentModelVC
        var viewControllers = Array<AnyObject>()
        viewControllers.append(startVC)
        
        self.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
    }
    
    
    /**
     * viewPageController 구성 함수
     */
    func viewControllerAtIndex (index : Int) -> ContentModelVC {
        
        let vc : ContentModelVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentModelVC") as! ContentModelVC
        
        vc.pageIndex = index
        vc.modelHeight = self.pageHeight[index]
        vc.imageFile = self.pageImages[index] //as! String
        
        return vc
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        /*
        let vc = viewController as! ContentModelVC
        guard let viewControllerIndex = vc.pageIndex else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return self.viewControllerAtIndex(index : 4)
        }
        
        guard self.pageImages.count > previousIndex else {
            return nil
        }
        
        return self.viewControllerAtIndex(index: previousIndex)
         */
        
        let vc = viewController as! ContentModelVC
        guard let viewControllerIndex = vc.pageIndex else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard self.pageImages.count > previousIndex else {
            return nil
        }
        
        return self.viewControllerAtIndex(index: previousIndex)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        /*
        let vc = viewController as! ContentModelVC
        guard let viewControllerIndex = vc.pageIndex else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = self.pageImages.count
        
        guard orderedViewControllersCount != nextIndex else {
            return self.viewControllerAtIndex(index : 0)
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return self.viewControllerAtIndex(index : nextIndex)
        */
        
        let vc = viewController as! ContentModelVC
        guard let viewControllerIndex = vc.pageIndex else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = self.pageImages.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return self.viewControllerAtIndex(index: nextIndex)
    }
    
    // 페이지뷰 모델의 갯수 반환
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageImages.count
    }
    
    // 현재 표시되는 뷰컨트롤러의 인덱스 반환
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let pageContent: ContentModelVC = viewControllers?.first as! ContentModelVC
        
        return pageContent.pageIndex
    }

    
    
}
