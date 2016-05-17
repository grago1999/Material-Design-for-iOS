//
//  MDNavBar.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDNavBar: MDView {
    
    var screenWidth = UIScreen.mainScreen().bounds.size.width
    var screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var statusBarView = UIView()
    
    init(frame:CGRect, backgroundColor:UIColor) {
        super.init(frame:frame)
        
        self.backgroundColor = backgroundColor
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        self.frame = CGRectMake(0, statusBarHeight, screenWidth, (screenHeight/10))
        
        statusBarView = UIView(frame:CGRectMake(0, -statusBarHeight, screenWidth, statusBarHeight))
        statusBarView.backgroundColor = backgroundColor.colorWithAlphaComponent(0.8)
        self.addSubview(statusBarView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
}
