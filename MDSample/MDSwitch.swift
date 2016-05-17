//
//  MDSwitch.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDSwitch: UIButton {
    
    var screenWidth = UIScreen.mainScreen().bounds.size.width
    var screenHeight = UIScreen.mainScreen().bounds.size.height
    
    private var switchView = MDView(frame:CGRectZero)
    private var barView = UIView()
    private var onColor = UIColor()
    private var isOn = false
    private var isAnimating = false
    
    init(frame:CGRect, color:UIColor, shouldBeOn:Bool) {
        super.init(frame:frame)
        
        onColor = UIColor.clearColor()
        let width = screenWidth/5
        let height = width/1.4
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height)
        self.backgroundColor = UIColor.clearColor()
        
        let barViewWidth = screenWidth/12
        let barViewHeight = barViewWidth/2.5
        
        barView = UIView(frame:CGRectMake(0, 0, barViewWidth, barViewHeight))
        barView.center = CGPointMake(width/2, height/2)
        barView.layer.cornerRadius = barView.frame.size.height/2
        barView.backgroundColor = onColor
        barView.userInteractionEnabled = false
        self.addSubview(barView)
        
        let btn = UIButton(frame:CGRectMake(0, 0, width, height))
        btn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        btn.backgroundColor = UIColor.clearColor()
        btn.addTarget(self, action:#selector(MDSwitch.switchState), forControlEvents:UIControlEvents.TouchUpInside)
        btn.layer.zPosition = 2
        self.addSubview(btn)
        
        onColor = color
        isOn = shouldBeOn
        
        switchView = MDView(frame:CGRectMake(0, 0, barView.frame.size.height*1.5, barView.frame.size.height*1.5))
        switchView.layer.cornerRadius = switchView.frame.size.width/2
        switchView.layer.zPosition = -1
        switchView.userInteractionEnabled = false
        if isOn {
            switchView.center = CGPointMake(barView.frame.origin.x, self.frame.size.height/2)
            switchView.backgroundColor = onColor
            barView.backgroundColor = onColor.colorWithAlphaComponent(0.8)
        } else {
            switchView.center = CGPointMake(barView.frame.origin.x+barView.frame.size.width, self.frame.size.height/2)
            switchView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.85)
            barView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.7)
        }
        self.addSubview(switchView)
    }
    
    func switchState() {
        if !isAnimating {
            isAnimating = true
            isOn = !isOn
            UIView.animateWithDuration(0.5, animations: {
                if self.isOn {
                    self.switchView.center = CGPointMake(self.barView.frame.origin.x+self.barView.frame.size.width, self.frame.size.height/2)
                    self.switchView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.85)
                    self.barView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.7)
                } else {
                    self.switchView.center = CGPointMake(self.barView.frame.origin.x, self.frame.size.height/2)
                    self.switchView.backgroundColor = self.onColor
                    self.barView.backgroundColor = self.onColor.colorWithAlphaComponent(0.8)
                }
            }, completion: { finished in
                self.isAnimating = false
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

}
