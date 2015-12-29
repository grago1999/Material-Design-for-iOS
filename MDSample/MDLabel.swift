//
//  MDLabel.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.clearColor()
        self.textAlignment = NSTextAlignment.Center
    }
    
    func setup(withText:String, withTextColor:UIColor) {
        self.text = withText
        self.textColor = withTextColor
        self.font = UIFont(name:"Roboto-Bold", size:20.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
