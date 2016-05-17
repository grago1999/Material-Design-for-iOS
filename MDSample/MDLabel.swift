//
//  MDLabel.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDLabel: UILabel {
    
    init(frame:CGRect, text:String, textColor:UIColor, textAlignment:NSTextAlignment, fontSize:CGFloat) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.clearColor()
        self.textAlignment = textAlignment
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name:"Roboto-Bold", size:fontSize)
    }
    
    func setupAsPlaceholder() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.clearColor().CGColor
        self.layer.shadowOpacity = 0.0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
}
