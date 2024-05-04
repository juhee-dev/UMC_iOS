//
//  ViewController.swift
//  week08
//
//  Created by juhee on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var grayViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var grayViewHeightContstraint: NSLayoutConstraint!
    @IBOutlet var grayViewTapGestureRecognizer: UITapGestureRecognizer!
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grayViewTapGestureRecognizer.addTarget(self, action: #selector(grayViewDidTap))
    }
    
    @objc func grayViewDidTap() {
        if !flag {
            UIView.animate(withDuration: 3, animations: {
                self.grayViewTopConstraint.constant = 50
                self.grayViewHeightContstraint.constant = 500
                self.view.layoutIfNeeded()
            },
                           completion: { _ in
                self.flag = true
            }
            )
        } else {
            UIView.animate(withDuration: 3, animations: {
                self.grayViewTopConstraint.constant = 130
                self.grayViewHeightContstraint.constant = 100
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag = false
            }
            )
        }
    }

//    @IBAction func buttonDidTap(_ sender: Any) {
//        UIView.animate(withDuration: 3, animations: {
//            self.grayViewTopConstraint.constant = 50
//            self.grayViewHeightContstraint.constant = 500
//            // UI 관련한 변경사항 업데이트가 필요함을 view에 알려줘 바로 반영됨
//            self.view.layoutIfNeeded()
//            // 비슷한 동작 - 찾아볼 것
//            // self.view.setNeedsLayout()
//            // self.view.setNeedsDisplay()
//        })
//    }
    
}

