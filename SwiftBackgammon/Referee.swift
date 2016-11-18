//
//  Referee.swift
//  SwiftBackgammon
//
//  Created by CareTek on 2016/7/25.
//  Copyright © 2016年 Cheng. All rights reserved.
//

import Foundation
import UIKit

struct Referee {
    
    static func checkWinner(existArray:Array<dotView>, chessView: dotView) -> Bool{
        if existArray.count < 4 {
            print("Not Enough chess")
            return false
        }
        return horizonCompare(existArray: existArray, chessView: chessView) || verticalCompare(existArray: existArray, chessView: chessView) || uprightCompare(existArray: existArray, chessView: chessView) || upleftCompare(existArray: existArray, chessView: chessView)
    }
    
    static func horizonCompare(existArray:Array<dotView>, chessView: dotView) -> Bool{
        let winCount = (superCompare(existArray: existArray, chessView: chessView, addXorMinus: true, addYorMinus: nil) + superCompare(existArray: existArray, chessView: chessView, addXorMinus: false, addYorMinus: nil))
        print("hor : \(winCount)")
        return winCount >= 4
    }
    
    static func verticalCompare(existArray:Array<dotView>, chessView: dotView) -> Bool{
        let winCount = (superCompare(existArray: existArray, chessView: chessView, addXorMinus: nil, addYorMinus: true) + superCompare(existArray: existArray, chessView: chessView, addXorMinus: nil, addYorMinus: false))
        print("ver : \(winCount)")
        return winCount >= 4
    }
    
    static func uprightCompare(existArray:Array<dotView>, chessView: dotView) -> Bool{
        let winCount = (superCompare(existArray: existArray, chessView: chessView, addXorMinus: true, addYorMinus: true) + superCompare(existArray: existArray, chessView: chessView, addXorMinus: false, addYorMinus: false))
        print("upright : \(winCount)")
        return winCount >= 4
    }
    
    static func upleftCompare(existArray:Array<dotView>, chessView: dotView) -> Bool{
        let winCount = (superCompare(existArray: existArray, chessView: chessView, addXorMinus: false, addYorMinus: true) + superCompare(existArray: existArray, chessView: chessView, addXorMinus: true, addYorMinus: false))
        print("upleft : \(winCount)")
        return winCount >= 4
    }
    
    static func superCompare(existArray:Array<dotView>, chessView: dotView,addXorMinus:Bool?, addYorMinus:Bool?) -> Int{
        var colcuX = 0
        var colcuY = 0
        
        var winCount = 0
        var oldWinCount = 0
        
        for i in 1...4 {
            if (addXorMinus != nil && addXorMinus!) {
                colcuX = i
            }else if addXorMinus != nil && !addXorMinus!{
                colcuX = -i
            }// if nil keep 0
            
            if (addYorMinus != nil && addYorMinus!) {
                colcuY = i
            }else if addYorMinus != nil && !addYorMinus!{
                colcuY = -i
            }// if nil keep 0
//            print("cx : \(colcuX) cy :\(colcuY)")
            oldWinCount = winCount
            
            for dotView in existArray {
                if dotView.x! == chessView.x! + colcuX && dotView.y! == chessView.y! + colcuY{
                    winCount += 1
                    break
                }
            }// for in
            
            if oldWinCount == winCount {
                return winCount
            }
        }// for i
        
        return winCount
    }
    
}
