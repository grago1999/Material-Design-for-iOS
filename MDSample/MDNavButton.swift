//
//  MDNavButton.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDNavButton: MDRoundButton {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.layer.shadowOpacity = 0.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
