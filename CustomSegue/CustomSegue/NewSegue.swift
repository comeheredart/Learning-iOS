//
//  NewSegue.swift
//  CustomSegue
//
//  Created by JEN Lee on 2021/01/28.
//

import Foundation
import UIKit

class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        let srcUVC = self.source
        //읽어온 속성은 VC타입이다.
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
        //view를 바꾸는 것! UIView의 타입 메소드이기 때문에 인스턴스화 필요없음.
    }
}
