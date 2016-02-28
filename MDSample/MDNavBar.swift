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
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        self.frame = CGRectMake(0, statusBarHeight, screenWidth, (screenHeight/10))
        
        statusBarView = UIView(frame:CGRectMake(0, -statusBarHeight, screenWidth, statusBarHeight))
        self.addSubview(statusBarView)
    }
    
    func setupWithBackgroundColor(color:UIColor) {
        self.backgroundColor = color
        statusBarView.backgroundColor = color.colorWithAlphaComponent(0.8)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
