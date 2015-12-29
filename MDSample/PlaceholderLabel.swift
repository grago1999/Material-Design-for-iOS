//
//  PlaceholderLabel.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class PlaceholderLabel: MDLabel {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.clearColor().CGColor
        self.layer.shadowOpacity = 0.0
        self.textAlignment = NSTextAlignment.Left
        self.font = UIFont(name:"Roboto-Thin", size:20.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
