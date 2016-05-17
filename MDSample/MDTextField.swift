//
//  MDTextField.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDTextField: MDView, UITextFieldDelegate {
    
    var textField = UITextField()
    private var placeholderLabel:MDLabel?
    
    private var tapView = UIView()
    private var isShowingTap = false
    
    init(frame:CGRect, backgroundColor:UIColor, placeholder:String, textColor:UIColor) {
        super.init(frame:frame)
        self.layer.shadowOpacity = 0.0
        self.layer.cornerRadius = 0.0
        
        textField = UITextField(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        textField.textColor = UIColor.blackColor()
        textField.font = UIFont(name:"Roboto-Medium", size:20.0)
        textField.enabled = false
        textField.delegate = self
        self.addSubview(textField)
        
        tapView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        tapView.layer.masksToBounds = true
        tapView.userInteractionEnabled = false
        self.addSubview(tapView)
        
        self.backgroundColor = backgroundColor
        textField.textColor = textColor
        var placeholderTextColor = textColor
        if textColor == UIColor.blackColor() {
            placeholderTextColor = UIColor.grayColor().colorWithAlphaComponent(0.75)
        }
        placeholderLabel = MDLabel(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height), text:placeholder, textColor:placeholderTextColor, textAlignment:NSTextAlignment.Left, fontSize:20.0)
        placeholderLabel?.setupAsPlaceholder()
        self.addSubview(placeholderLabel!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !isShowingTap {
            isShowingTap = true
            textField.enabled = true
            if !textField.isFirstResponder() {
                textField.becomeFirstResponder()
            }
            let touch = touches.first
            let location = touch?.locationInView(self)
            
            let duration = 0.75
            let tapShadowView = UIView(frame:CGRectMake(0, 0, self.frame.size.height/2, self.frame.size.height/2))
            tapShadowView.center = location!
            tapShadowView.backgroundColor = UIColor.blackColor()
            tapShadowView.alpha = 0.3
            tapShadowView.layer.masksToBounds = true
            tapShadowView.layer.cornerRadius = tapShadowView.frame.size.width/2
            tapView.addSubview(tapShadowView)
            
            CATransaction.begin()
            CATransaction.setCompletionBlock ({
                UIView.animateWithDuration(0.2, animations: {
                    tapShadowView.alpha = 0
                }, completion: { finished in
                    self.isShowingTap = false
                    tapShadowView.removeFromSuperview()
                })
            })
            let transformAnim = CABasicAnimation(keyPath:"transform.scale")
            transformAnim.duration = duration
            transformAnim.fromValue = 0.1
            transformAnim.toValue = (self.frame.size.width/tapShadowView.frame.size.width)*2.25
            transformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            transformAnim.fillMode = kCAFillModeForwards
            transformAnim.removedOnCompletion = false
            tapShadowView.layer.addAnimation(transformAnim, forKey:"transform.scale")
            CATransaction.commit()
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newStr = textField.text!
        if string.characters.count == 1 {
            newStr = newStr+string
        } else {
            newStr = newStr.substringToIndex(newStr.endIndex.predecessor())
        }
        
        if newStr.characters.count == 1 && string.characters.count == 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.placeholderLabel!.transform = CGAffineTransformMakeScale(0.6, 0.6)
                self.placeholderLabel!.frame = CGRectMake(0, -self.placeholderLabel!.frame.size.height/4, self.placeholderLabel!.frame.size.width, self.placeholderLabel!.frame.size.height)
            })
        } else if newStr.characters.count == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.placeholderLabel!.transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.placeholderLabel!.frame = CGRectMake(0, 0, self.placeholderLabel!.frame.size.width, self.placeholderLabel!.frame.size.height)
            })
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.enabled = false
        isShowingTap = false
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        isShowingTap = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
}
