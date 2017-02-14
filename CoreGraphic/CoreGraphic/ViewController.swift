//
//  ViewController.swift
//  CoreGraphic
//
//  Created by Robin on 14/02/17.
//  Copyright © 2017年 广州雅特. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

//这是关于 字体的
class AView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        
        
        var fontName = ""
        let count1 = ((Int)(arc4random())) %  (UIFont.familyNames.count)
        let familyName = UIFont.familyNames[count1]
        let count2 = UIFont.fontNames(forFamilyName: familyName).count
        
        fontName = UIFont.fontNames(forFamilyName: familyName)[ ((Int)(arc4random())) % count2 ]
        
        let font = UIFont.init(name: fontName, size: 30)
        
        let s:NSString  = "Core Graphics" as NSString
        
        s.draw(at: CGPoint.init(x: 30, y: 100), withAttributes: [NSFontAttributeName:font as Any,
                                                                 NSForegroundColorAttributeName: UIColor.black])
    }
    
    
    
    
}

