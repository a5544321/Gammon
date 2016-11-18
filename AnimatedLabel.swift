//
//  AnimatedLabel.swift
//  SwiftBackgammon
//
//  Created by CareTek on 2016/7/26.
//  Copyright © 2016年 Cheng. All rights reserved.
//

import Foundation
import UIKit

class AnimatedLabel: NSObject {
    var content:String = ""
    var fontSize:CGFloat = 20;
    var point:CGPoint = CGPoint(x:0,y:0)
    var distance:CGFloat = 3
    var labelArray:Array<UILabel> = []
    
    
    init(content:String , fontSize:CGFloat , startPoint:CGPoint , distance:CGFloat) {
        super.init()
        self.content = content
        self.fontSize = fontSize
        self.point = startPoint
        self.distance = distance
        
        createLabels()
    }
    
    func createLabels() -> Void {
        for i in 0...(self.content.characters.count-1) {
            let label:UILabel = UILabel.init()
            label.text = String(self.content[self.content.index(self.content.startIndex, offsetBy: i)])
            label.font = UIFont.boldSystemFont(ofSize: fontSize)
            labelArray.append(label)
        }
    }
    
    func animateInView(View parentView:UIView) -> Void {
        let duration = 0.4
        for i in 0...labelArray.count-1 {
            let label = labelArray[i]
            label.frame = CGRect(x:point.x + (fontSize + distance) * CGFloat(i), y:point.y, width:fontSize, height:fontSize)
            parentView.addSubview(label)
            
            label.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
            UIView.animate(withDuration: duration
                , delay: 0
                , options:  .curveLinear
                , animations: {
                    
                    label.transform = (label.transform).scaledBy(x: 3.16, y: 3.16)
                    label.transform = (label.transform).rotated(by: CGFloat(M_PI));
                    
            }) { finished in
                UIView.animate(withDuration: duration
                    , delay: 0.0
                    , options:  .curveLinear
                    , animations: {
                        
                        label.transform = (label.transform).scaledBy(x: 3.16, y: 3.16)
                        label.transform = (label.transform).rotated(by: CGFloat(M_PI));
                        
                }) { finished in
                    UIView.animate(withDuration: duration
                        , delay: 0.0
                        , options:  .curveLinear
                        , animations: {
                            
                            label.transform = (label.transform).scaledBy(x: 3.16, y: 3.16)
                            label.transform = (label.transform).rotated(by: CGFloat(M_PI));
                            
                    }) { finished in
                        UIView.animate(withDuration: duration
                            , delay: 0.0
                            , options:  .curveLinear
                            , animations: {
                                
                                label.transform = (label.transform).scaledBy(x: 3.16, y: 3.16)
                                label.transform = (label.transform).rotated(by: CGFloat(M_PI));
                                
                        }) { finished in
                            
                        }
                    }
                }
            }
        }
    }
    
    func dismiss() -> Void {
        print("dismiss")
        for label in labelArray {
            label.removeFromSuperview()
        }
    }
    
    
    
}
