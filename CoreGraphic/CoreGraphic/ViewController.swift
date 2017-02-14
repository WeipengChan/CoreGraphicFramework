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
        
        let view  = AView.init(frame: CGRect.init(x: 50, y: 100, width: 1000, height: 1000))
        view.backgroundColor = UIColor.clear
        self.view.addSubview( view )
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

//这是关于 字体的
class AView: UIView {
    
    var context:CGContext!;
    let y = 200
    let stokeRect = CGRect.init(x: 20, y: 200 - 20, width: 100, height: 100)


    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext();
        context.rotate(by:  CGFloat(radians(-30)))

       self.drawSomeText()
       self.drawAline()
       self.drawLineJoin()
       self.drawARect()
        
    

    }
    

    func drawSomeText()
    {

        
        var fontName = ""
        let count1 = ((Int)(arc4random())) %  (UIFont.familyNames.count)
        let familyName = UIFont.familyNames[count1]
        let count2 = UIFont.fontNames(forFamilyName: familyName).count
        
        if count2 == 0
        {
            self.drawSomeText()
            return
        }
        fontName = UIFont.fontNames(forFamilyName: familyName)[ ((Int)(arc4random())) % count2 ]
        
        let font = UIFont.init(name: fontName, size: 30)
        
        let s:NSString  = "I love " as NSString
        
        s.draw(at: CGPoint.init(x: 30, y: 50), withAttributes: [NSFontAttributeName:font as Any,
                                                               NSForegroundColorAttributeName: UIColor.blue])
        
        
    }
    
    //绘制一条线
    func drawAline()
    {
        UIColor.brown.set()
          context.setLineWidth(2.0)
        context.move(to: CGPoint.init(x: 30, y: y))
        context.addLine(to: CGPoint.init(x: 290, y: y))
        context.strokePath()
        
    }
    
        /** 开始乱画；  */
    func drawLineJoin()
    {
        context.setLineWidth(2.0)
        context.setLineJoin(.round)
        context.move(to: CGPoint.init(x: 30, y: y))
        context.addLine(to: CGPoint.init(x: 10, y: y-20))
        context.addLine(to: CGPoint.init(x: 40, y: y-10))
        context.strokePath()

    }
    
    /** 开始矩形；  */
    func drawARect()
    {
        UIColor.red.set()
        context.stroke(stokeRect)
        
        self.drawGradientColor()
       // context.setFillColor(UIColor.init(colorLiteralRed: 0.5, green: 0.0, blue: 0.0, alpha: 0.2).cgColor)
       // context.fill(stokeRect)
    }
    
    func drawGradientColor()
    {
        let startPoint = CGPoint.init(x: stokeRect.minX , y: stokeRect.minY)
        let endPoint = CGPoint.init(x: stokeRect.maxX, y: stokeRect.maxY)
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let arrays = [ UIColor.init(red: 0.3, green: 0, blue: 0.2, alpha: 0.2).cgColor,
                       UIColor.init(red: 0.0, green: 0, blue: 1.0, alpha: 0.8).cgColor,]
        let locations:[CGFloat] = [0.0 as CGFloat, 1.0 as  CGFloat]
        let gradient  = CGGradient.init(colorsSpace: colorSpace, colors: arrays as CFArray, locations: locations)
        
        context.saveGState()
        context.addRect(stokeRect)
        context.clip()
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .init(rawValue: 0))
        
        
        context.restoreGState()
        
        
        
    }
    
    
}






