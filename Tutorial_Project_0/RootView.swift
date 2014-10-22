//
//  RootView.swift
//  Tutorial_Project_0
//
//  Created by guafei on 14-10-21.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

import Foundation
import UIKit

let BUTTON_COUNT = 5,RECT_WIDTH:CGFloat = 100.0,RECT_HEIGHT:CGFloat = 50.0,MARGIN_LEFT:CGFloat = (SCREEN_BOUNDS.size.width / 2.0 - RECT_WIDTH)/2.0,MARGIN_TOP:CGFloat = 40.0

let USE_BLOCK = true

typealias funcBlock = () -> ()
typealias funcBlockA = (Int,Int) -> String
typealias funcBlockB = (Int,Int) -> (String)->()
typealias funcBlockC = (Int,Int) -> (String)->String

protocol RootViewDelegate
{
    func demoBtnClicked()
}

class RootView: UIView
{
    var delegate: RootViewDelegate?
    var demoClickBlock: funcBlock?
    
    func initViewWithFrame(externalFrame:CGRect)
    {
        var buttonCount:Int = BUTTON_COUNT
        var tFrame:CGRect = CGRectZero
        self.frame = externalFrame;
        for index in 0..<buttonCount
        {
            var tempBtn = UIButton()
            var x:CGFloat,y:CGFloat
            if(index % 2 == 0)
            {
                tFrame.origin.x = MARGIN_LEFT
            }else
            {
                tFrame.origin.x = MARGIN_LEFT * 3 + RECT_WIDTH
            }
            tFrame.origin.y = MARGIN_TOP * (CGFloat(index/2) + 1.0) + RECT_HEIGHT * CGFloat(index/2)
            
            tFrame.size.width = RECT_WIDTH
            tFrame.size.height = RECT_HEIGHT
            tempBtn.frame = tFrame
            
            tempBtn.backgroundColor = UIColor.blueColor()
            tempBtn.tag = index
            tempBtn.setTitle("Demo"+"\(index)", forState: UIControlState.Normal)
            tempBtn.addTarget(self, action:"tappedButton:",forControlEvents:UIControlEvents.TouchUpInside)
            self.addSubview(tempBtn)
        }
    }
    
    func tappedButton(button : UIButton)
    {
        if(USE_BLOCK)
        {
            demoClickBlock?()
        }else
        {
            delegate?.demoBtnClicked()
        }
    }

    
    
    
    
}