//
//  MDScrollView.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.shadowRadius).CGPath
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
