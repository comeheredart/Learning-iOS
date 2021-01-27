//
//  ViewController.swift
//  CustomSegue
//
//  Created by JEN Lee on 2021/01/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("id : \(segue.identifier ?? "None")")
        
        if segue.identifier == "custom_segue" {
            NSLog("커스텀 세그가 실행됨")
        } else if segue.identifier == "action_segue" {
            NSLog("액션 세그가 실행됨")
        } else {
            NSLog("알 수 없는 세그입니다.")
        }
    }


}

