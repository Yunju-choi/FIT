//
//  SaveFitVC.swift
//  fit
//
//  Created by 최윤주 on 2017. 1. 3..
//  Copyright © 2017년 SOPT. All rights reserved.
//
// 깃허브 https://github.com/fumiyasac/CustomizeUISample 에서 사용
//

import UIKit


// 테이블 뷰에 관련된 상수
struct PageSettings {
    
    // UIScrollView의 크기에 대한 세팅
    static let menuScrollViewY : Int = 64 // 네비게이션 바 보이도록 높이 설정
    static let menuScrollViewH : Int = 40
    static let slidingLabelY : Int = 36
    static let slidingLabelH : Int = 4
    
    var myFitCollectionList = [[MyFitVO]]()
    
    //UIScrollView에 표시하는 버튼 명칭
    static let pageScrollNavigationList: [String] = [
        "상의",
        "하의",
        "단벌"
    ]
    
    //UIPageViewController에 배치하는 UIViewController의 이름
    static let pageControllerIdentifierList : [String] = [
        "SaveTopCVC",
        "SaveBottomCVC",
        "SaveOneCVC"
    ]
    
    //UIPageViewController에 추가하는 ViewController의 리스트 생성
    static func generateViewControllerList() -> [UIViewController] {
        
        var viewControllers : [UIViewController] = []
        self.pageControllerIdentifierList.forEach { viewControllerName in
            
            //ViewController의 Identifier에서 ViewController를 만듦
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(viewControllerName)")
            
            viewControllers.append(viewController)
            //print(viewControllerName)
        }
        print("#####")
        print(viewControllers.count)
        return viewControllers
    }
    
}

class SaveFitVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
    
    var viewControllerIndex = 0
    var slidingLabel : UILabel!
    var pageViewController : UIPageViewController!
    var vcList = [UIViewController]()
    var pageContentsControllerList : [String] = []
    var menuScrollView : UIScrollView!
    var scrollButtonOffsetX : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.menuScrollView = UIScrollView()
        self.menuScrollView.delegate = self
        self.view.addSubview(self.menuScrollView)
        self.slidingLabel = UILabel()
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        vcList = PageSettings.generateViewControllerList()
    
        self.pageViewController.setViewControllers([vcList.first!], direction: .forward, animated: false, completion: nil)
        
        //UIPageViewController를 자식의 ViewController로 등록
        self.addChildViewController(self.pageViewController)
        
        //UIPageViewController를 배치
        self.view.addSubview(self.pageViewController.view)
    }
    
    // 레이아웃 작업이 완료되었을 때의 처리
    override func viewDidLayoutSubviews() {
        
        //UIScrollView의 크기를 변경
        self.menuScrollView.frame = CGRect(
            x: CGFloat(0),
            y: CGFloat(PageSettings.menuScrollViewY),
            width: CGFloat(self.view.frame.width),
            height: CGFloat(PageSettings.menuScrollViewH)
        )
        
        // UIPageViewController의 크기를 변경
        // 크기의 상정 → (X 좌표 : 0, Y 좌표 : [UIScrollView의 Y 좌표 + 높이, 폭 : [대원의 View의 너비, 높이 : 오오 아래의 View의 높이 - [UIScrollView의 Y 좌표 + 높이)
        
        self.pageViewController.view.frame = CGRect(
            x: CGFloat(0),
            y: CGFloat(self.menuScrollView.frame.origin.y + self.menuScrollView.frame.height),
            width: CGFloat(self.view.frame.width),
            height: CGFloat(self.view.frame.height - (self.menuScrollView.frame.origin.y + self.menuScrollView.frame.height))
        )
        self.pageViewController.view.backgroundColor = UIColor.gray
        self.menuScrollView.backgroundColor = UIColor(hex: 0xF6A2A4, alpha: 1.0)
        
        //UIScrollView의 초기 설정
        self.initContentsScrollViewSettings()
        
        //UIScrollView에 버튼 배치
        for i in 0...(PageSettings.pageScrollNavigationList.count - 1){
            self.addButtonToButtonScrollView(i)
        }
        
        //움직이는 레이블 배치
        self.menuScrollView.addSubview(self.slidingLabel)
        self.menuScrollView.bringSubview(toFront: self.slidingLabel)
        self.slidingLabel.frame = CGRect(
            x: CGFloat(0),
            y: CGFloat(PageSettings.slidingLabelY),
            width: CGFloat(self.view.frame.width / 3),
            height: CGFloat(PageSettings.slidingLabelH)
        )
        self.slidingLabel.backgroundColor = UIColor(hex: 0xFF6671, alpha: 1.0)
        self.moveToCurrentButtonScrollView(0)
        self.moveToCurrentButtonLabel(0)
    }
    
    // 페이지를 다음으로 넘길 때 실행되는 처리
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        print("after 전")
        print(self.viewControllerIndex)
        print(viewController)
        
//        if self.viewControllerIndex == targetViewControllers.count - 1 {
//            return nil
//        } else {
//            self.viewControllerIndex = self.viewControllerIndex + 1
        //        }
        
        if viewController === vcList[0] {
            self.moveToCurrentButtonScrollView(0)
            self.moveToCurrentButtonLabel(0)
            self.viewControllerIndex = 1
        } else if viewController === vcList[1] {
            self.moveToCurrentButtonScrollView(1)
            self.moveToCurrentButtonLabel(1)
            self.viewControllerIndex = 2
        } else if viewController === vcList[2] {
            self.moveToCurrentButtonScrollView(2)
            self.moveToCurrentButtonLabel(2)
            return nil
        } else {
            return nil
        }
        
                print("after 후")
        print(self.viewControllerIndex)
        // 스크롤 뷰와 버튼을 누르면 버튼에 따라 이동
        
        return vcList[self.viewControllerIndex]
    }
    
    // 페이지를 전으로 넘길 때 실행되는 처리
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        print("before 전")
        print(self.viewControllerIndex)
        
//        if self.viewControllerIndex == 0 {
//            return nil
//        } else {
//            self.viewControllerIndex = self.viewControllerIndex - 1
//        }
        if viewController === vcList[0] {
            self.moveToCurrentButtonScrollView(0)
            self.moveToCurrentButtonLabel(0)
            return nil
        } else if viewController === vcList[1] {
            self.moveToCurrentButtonScrollView(1)
            self.moveToCurrentButtonLabel(1)
            self.viewControllerIndex = 0
        } else if viewController === vcList[2] {
            self.moveToCurrentButtonScrollView(2)
            self.moveToCurrentButtonLabel(2)
            self.viewControllerIndex = 1
        } else {
            return nil
        }
        print("before 후")
        print(self.viewControllerIndex)
        // 스크롤 뷰와 버튼을 누르면 버튼에 따라 이동
        
        return vcList[self.viewControllerIndex]
    }
    
    func initContentsScrollViewSettings() {
        
        self.menuScrollView.isPagingEnabled = false
        self.menuScrollView.isScrollEnabled = true
        self.menuScrollView.isDirectionalLockEnabled = false
        self.menuScrollView.showsHorizontalScrollIndicator = false
        self.menuScrollView.showsVerticalScrollIndicator = false
        self.menuScrollView.bounces = false
        self.menuScrollView.scrollsToTop = false
        
        self.menuScrollView.contentSize = CGSize(
            width: CGFloat(Int(self.view.frame.width) * PageSettings.pageScrollNavigationList.count / 3),
            height: CGFloat(PageSettings.menuScrollViewH)
        )
    }
    
    func addButtonToButtonScrollView(_ i: Int) {
        
        let buttonElement: UIButton! = UIButton()
        self.menuScrollView.addSubview(buttonElement)
        
        let pX: CGFloat = CGFloat(Int(self.view.frame.width) / 3 * i)
        let pY: CGFloat = CGFloat(0)
        let pW: CGFloat = CGFloat(Int(self.view.frame.width) / 3)
        let pH: CGFloat = CGFloat(self.menuScrollView.frame.height)
        
        buttonElement.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
        buttonElement.backgroundColor = UIColor.clear
        buttonElement.setTitle(PageSettings.pageScrollNavigationList[i], for: UIControlState())
        buttonElement.titleLabel!.font = UIFont(name: "Bold", size: CGFloat(16))
        buttonElement.tag = i
        buttonElement.addTarget(self, action: #selector(SaveFitVC.buttonTapped(_:)), for: .touchUpInside)
    }
    
    // 버튼을 누를 때 발생하는 것
    func buttonTapped(_ button: UIButton){
        
        // 밀린 버튼 태그를 획득
        let page: Int = button.tag
        
        // UIPageViewController의에서 표시 대상을 결정하는
        if self.viewControllerIndex != page {
            
            self.pageViewController.setViewControllers([PageSettings.generateViewControllerList()[page]], direction: .forward, animated: true, completion: nil)
            
            self.viewControllerIndex = page
            
            // 스크롤 뷰와 버튼을 누르면 버튼에 따라 이동
            self.moveToCurrentButtonScrollView(page)
            self.moveToCurrentButtonLabel(page)
        }
    }
    
    // 버튼 슬라이드 뷰를 슬라이딩
    func moveToCurrentButtonScrollView(_ page: Int) {
        print("@@@@@")
        print(page)
        // 버튼을 내포하고있는 스크롤 뷰의 위치를 ​​조절할
        if page > 0 && page < (PageSettings.pageScrollNavigationList.count - 1) {
            self.scrollButtonOffsetX = Int(self.view.frame.size.width) / 3 * (page - 1)
            // 맨 처음 page 번호 때의 이동량
        } else if page == 0 {
            self.scrollButtonOffsetX = 0
            // 맨 마지막 page 번호 때의 이동량
        } else if page == (PageSettings.pageScrollNavigationList.count - 1) {
            self.scrollButtonOffsetX = Int(self.view.frame.size.width) / 3 * (page - 2)
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            
            self.menuScrollView.contentOffset = CGPoint(
                x: CGFloat(self.scrollButtonOffsetX),
                y: CGFloat(0)
            )
            
        }, completion: nil)
        
    }
    
    // 움직이는 레이블을 슬라이딩
    func moveToCurrentButtonLabel(_ page: Int) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            
            self.slidingLabel.frame = CGRect(
                x: CGFloat(Int(self.view.frame.width) / 3 * page),
                y: CGFloat(PageSettings.slidingLabelY),
                width: CGFloat(Int(self.view.frame.width) / 3),
                height: CGFloat(PageSettings.slidingLabelH)
            )
            
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
