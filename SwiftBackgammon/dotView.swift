//
//  dotView.swift
//  SwiftBackgammon
//
//  Created by CareTek on 2016/7/25.
//  Copyright © 2016年 Cheng. All rights reserved.
//

import UIKit

protocol dotViewProtocol {
    func didClickDot (chessView: dotView)
}

class dotView: UIView {
    var delegate:dotViewProtocol?
    
    var circleView:UIView?
    
    var x:Int?
    var y:Int?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
       super.init(frame: frame)
        normalInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func normalInit() -> Void {
        self.backgroundColor = UIColor.clear
        circleView = UIView.init(frame: CGRect(x:self.frame.width * 0.1, y:self.frame.height * 0.1, width:self.frame.width * 0.8, height:self.frame.height * 0.8))
        circleView?.layer.cornerRadius = circleView!.frame.width / 2;
        circleView?.clipsToBounds = true;
        circleView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        self.addSubview(circleView!)
    }
    
    func setMatrixPosition(x:Int, y:Int) -> Void {
        self.x = x
        self.y = y
    }
    
    func setCircleColor(color: UIColor) -> Void {
        self.circleView?.backgroundColor = color
    }
    
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        delegate?.didClickDot(self)
////        print("x : \(self.x)  y : \(self.y)")
//    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.didClickDot(chessView: self)
    }
    
    
    
    
    
    
    
    
}
