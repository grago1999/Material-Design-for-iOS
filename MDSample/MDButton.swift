//
//  MDButton.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDButton: UIButton {
    
    private var tapView = UIView()
    private var isShowingTap = false
    private var isForNav:Bool
    private var isRound:Bool
    
    init(frame:CGRect, backgroundColor:UIColor, text:String, textColor:UIColor, isRound:Bool, isForNav:Bool) {
        self.isRound = isRound
        self.isForNav = isForNav
        super.init(frame:frame)
        
        self.backgroundColor = backgroundColor
        self.setTitle(text, forState:UIControlState.Normal)
        self.setTitleColor(textColor, forState:UIControlState.Normal)
        self.titleLabel?.font = UIFont(name:"Roboto-Medium", size:20.0)
        
        generalSetup()
        setupForType()
    }
    
    init(frame:CGRect, backgroundColor:UIColor, img:UIImage, isRound:Bool, isForNav:Bool) {
        self.isRound = isRound
        self.isForNav = isForNav
        super.init(frame:frame)
        
        self.backgroundColor = backgroundColor
        self.setImage(img, forState:UIControlState.Normal)
        
        generalSetup()
        setupForType()
    }
    
    private func generalSetup() {
        self.userInteractionEnabled = true
        
        tapView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        tapView.layer.masksToBounds = true
        tapView.userInteractionEnabled = false
        self.addSubview(tapView)
    }
    
    private func setupForType() {
        if !isForNav {
            addShadow()
        }
        if isRound {
            self.layer.cornerRadius = self.frame.size.width/2
            self.layer.shadowRadius = self.layer.cornerRadius
            tapView.layer.cornerRadius = self.layer.cornerRadius
        } else {
            if self.frame.size.width != self.frame.size.height {
                self.layer.cornerRadius = 5.0
            }
        }
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowRadius = self.layer.cornerRadius
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).CGPath
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !isShowingTap {
            isShowingTap = true
            self.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
            
            let touch = touches.first
            var location = touch?.locationInView(self)
            if isForNav {
                location = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
            }
            
            let duration = 0.75
            let tapShadowView = UIView(frame:CGRectMake(0, 0, self.frame.size.height/2, self.frame.size.height/2))
            tapShadowView.center = location!
            tapShadowView.backgroundColor = UIColor.blackColor()
            tapShadowView.alpha = 0.3
            tapShadowView.layer.masksToBounds = true
            tapShadowView.layer.cornerRadius = tapShadowView.frame.size.width/2
            tapView.addSubview(tapShadowView)
            
            let transformAnim = CABasicAnimation(keyPath:"transform.scale")
            transformAnim.duration = duration
            transformAnim.fromValue = 0.1
            transformAnim.toValue = (self.frame.size.width/tapShadowView.frame.size.width)*2.25
            transformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            transformAnim.fillMode = kCAFillModeForwards
            transformAnim.removedOnCompletion = false
            tapShadowView.layer.addAnimation(transformAnim, forKey:"transform.scale")
            CATransaction.commit()
            let delay = (duration*0.75)*Double(NSEC_PER_SEC)
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                UIView.animateWithDuration(0.2, animations: {
                    tapShadowView.alpha = 0
                }, completion: { finished in
                    self.isShowingTap = false
                    tapShadowView.removeFromSuperview()
                })
            })
        }
    }

    required init?(coder aDecoder: NSCoder) {
        isRound = false
        isForNav = false
        super.init(coder:aDecoder)
    }
    
}
