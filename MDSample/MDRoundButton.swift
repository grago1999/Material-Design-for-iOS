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
        tapView.layer.cornerRadius = self.layer.cornerRadius
        addShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
