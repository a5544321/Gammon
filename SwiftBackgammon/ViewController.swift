//
//  ViewController.swift
//  SwiftBackgammon
//
//  Created by CareTek on 2016/7/25.
//  Copyright © 2016年 Cheng. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.main.bounds.width


class ViewController: UIViewController, dotViewProtocol {
    @IBOutlet weak var restartBtn: UIButton!
    var chessboardView:UIView? = nil
    var nowPlayer:Bool = false // black
    var blackChesses:[dotView] = []
    var whiteChesses:[dotView] = []
    var alert:AnimatedLabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessboardView = UIView.init(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: self.view.frame.width))
        chessboardView?.backgroundColor = UIColor.brown
        self.view.addSubview(chessboardView!)
        
        for x in 0...14 {
            for y in 0...14 {
                let chessView:dotView = dotView.init(frame: CGRect(x: SCREENWIDTH / 15 * CGFloat(x), y: SCREENWIDTH / 15 * CGFloat(y), width: SCREENWIDTH / 15, height: SCREENWIDTH / 15))
                chessView.delegate = self
                chessboardView?.addSubview(chessView)
                
                chessView.setMatrixPosition(x: x, y: y)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didClickDot(chessView: dotView) {
        if chessView.circleView?.backgroundColor == UIColor.white ||  chessView.circleView?.backgroundColor == UIColor.black
        {
            return
        }
        
        
        let nowColor:UIColor = nowPlayer ? UIColor.white : UIColor.black
        chessView.setCircleColor(color: nowColor)
//        print("x : \(chessView.x)  y : \(chessView.y)")
        checkWinner(chessView: chessView)
        
    }
    
    func checkWinner(chessView: dotView) -> Void {
        if nowPlayer {
            if Referee.checkWinner(existArray: whiteChesses, chessView: chessView) {
                print("white win")
                showalert(title: "白子勝惹")
                self.chessboardView?.isUserInteractionEnabled = false
                self.view.backgroundColor = UIColor.yellow
            }else{
                whiteChesses.append(chessView)
                nowPlayer = !nowPlayer
            }
        }else{
            if Referee.checkWinner(existArray: blackChesses, chessView: chessView) {
                showalert(title: "黑子勝惹")
                print("black win")
                self.chessboardView?.isUserInteractionEnabled = false
                self.view.backgroundColor = UIColor.yellow
            }else{
                
                blackChesses.append(chessView)
                nowPlayer = !nowPlayer
            
            }
        }
        
    }
    
    func showalert(title: String) -> Void {
//        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "重新開始", style: .Default, handler: { (action) in
//            self.restartBtn.sendActionsForControlEvents(.TouchUpInside)
//        }))
//        alert.addAction(UIAlertAction.init(title: "觀看結果", style: UIAlertActionStyle.Default, handler: nil))
//        self.presentViewController(alert, animated: true) { 
//            
//        }
        
        alert = AnimatedLabel.init(content: title, fontSize: 50, startPoint:  CGPoint(x:40,y:60), distance: 33)
        alert!.animateInView(View: self.view)
    }
    
    @IBAction func restartBtnPressed(sender: AnyObject) {
        print("restart")
        for markedView in (chessboardView?.subviews)! {
            if markedView is dotView {
                 (markedView as! dotView).setCircleColor(color: UIColor.lightGray.withAlphaComponent(0.3))
            }
        }
        blackChesses.removeAll()
        whiteChesses.removeAll()
        nowPlayer = false
        self.chessboardView?.isUserInteractionEnabled = true
        alert?.dismiss()
        self.view.backgroundColor = UIColor.white
    }
    
}


typealias onSuccessClosure = ((String?)->())!

func myBlock(to number :Int, name:String, onSuccess: onSuccessClosure) -> Void {
//    onSuccess("There are \(number) \(name) in here")
}

