//
//  MDRoundButton.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDRoundButton: MDButton {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.shadowRadius = self.frame.size.width/2
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.shadowRadius).CGPath
        tapView.layer.cornerRadius = self.layer.cornerRadius
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
