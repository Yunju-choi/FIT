//
//  ToggleButton.swift
//  fit
//
//  Created by 최윤주 on 2016. 12. 27..
//  Copyright © 2016년 SOPT. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ToggleButtonDelegate {
    @objc optional func didToggle(_ button: ToggleButton)
}

//뷰컨트롤러와 스토리보드 화면을 커넥션해줄때 아이덴티티 인스펙터에서 클래스를 입력해준거 기억나시죠?
//마찬가지로 여러분이 버튼을 만들고 이를 토글버튼으로 사용하고 싶다면 아이덴티티 인스펙터에서 ToggleButton을 class로 설정해주셔야 합니다.
class ToggleButton : UIButton {
    
    var checked = false //true면 버튼 활성화 flase면 비활성화
    
    internal var checkedColor = UIColor(hex: 0xFF6671, alpha: 1.0)
    internal var checkedTextColor = UIColor.white
    internal var unCheckedColor = UIColor(hex: 0xF6A2A4, alpha: 1.0)
    internal var unCheckedTextColor = UIColor.white
    weak var delegate: ToggleButtonDelegate?
    
    
    
    //여러분이 이 토글버튼을 사용하려고 할때 어떤 기능들이 필요할지 고민해보고 메소드와 프로퍼티를 추가해주세요!
    
    
    //아래의 init 구문은 이 토글버튼이 초기화될 때 실행되는 구문입니다.
    //그대로 두시고 여러분들은 프로퍼티와 메소드만 직접 만들어주세요!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBtnClickEvent()
        
    }
    
    init(){
        super.init(frame: CGRect.zero)
        setBtnClickEvent()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBtnClickEvent()
    }
    
    func onToggleClick() {
        if checked {
            setButtonChecked(false)
        } else {
            setButtonChecked(true)
        }
        delegate?.didToggle?(self)
    }
    
    func setButtonChecked(_ check: Bool) {
        if check {
            self.setTitleColor(checkedTextColor, for: UIControlState())
            self.backgroundColor = checkedColor
            self.checked = true
        } else {
            self.setTitleColor(unCheckedTextColor, for: UIControlState())
            self.backgroundColor = unCheckedColor
            self.checked = false
        }
    }
    
    var isChecked: Bool {
        return checked
    }
    
    func setColors(_ checkedBG: UIColor, checkedText: UIColor, unCheckedBG: UIColor, unCheckedText: UIColor) {
        checkedColor = checkedBG
        checkedTextColor = checkedText
        unCheckedColor = unCheckedBG
        unCheckedTextColor = unCheckedText
    }
    
    func setBtnClickEvent() {
        self.addTarget(self, action: #selector(touchBtn(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func touchBtn(_ sender: ToggleButton) {
        onToggleClick()
    }
    
    /*
    //버튼에 클릭 이벤트를 달아주는 부분입니다.
    //여러분들이 @IBAction을 사용하여 정적으로 버튼에 이벤트를 달아주던 방식과 다르게 동적으로 버튼에 이벤트를 달아주는 방식입니다.
    //실습 때 여기까지 설명을 드리지 못했으니 아래의 코드를 참고해주시길 바랍니다!
    func setBtnClickEvent() {
        self.addTarget(self, action: #selector(ToggleButton.touchBtn(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func touchBtn(_ sender: ToggleButton) {
        //토글 버튼을 클릭했을 때의 이벤트를 작성해줍니다.
        if (check){
            self.backgroundColor = unclickedColor
            check = false
        }
        else{
            self.backgroundColor = clickedColor
            check = true
        }
    }
    */
    
}
