//
//  MDNavLabel.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/19/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class MDNavLabel: MDLabel {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.textAlignment = NSTextAlignment.Left
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
