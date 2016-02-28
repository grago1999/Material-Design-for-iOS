//
//  ViewController.swift
//  MDSample
//
//  Created by Gianluca Rago on 12/11/15.
//  Copyright © 2015 Ragoware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth = UIScreen.mainScreen().bounds.size.width
    var screenHeight = UIScreen.mainScreen().bounds.size.height
    
    let mainColor = UIColor(red:83.0/255.0, green:109.0/255.0, blue:254.0/255.0, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mdScrollView = MDScrollView(frame:CGRectMake(0, 0, screenWidth, screenHeight))
        self.view.addSubview(mdScrollView)
        
        let navBar = MDNavBar(frame:CGRectZero)
        navBar.setupWithBackgroundColor(mainColor)
        self.view.addSubview(navBar)
        
        let navBtnSize = navBar.frame.size.height/2
        let navBtn = MDNavButton(frame:CGRectMake(0, 0, navBtnSize, navBtnSize))
        navBtn.center = CGPointMake(navBar.frame.size.height/2, navBar.frame.size.height/2)
        navBtn.setup(mainColor, withImg:UIImage(named:"nav.png")!)
        navBar.addSubview(navBtn)
        
        let mdNavLabel = MDNavLabel(frame:CGRectMake(navBtn.frame.origin.x+(1.5*navBtnSize), 0, screenWidth/2, screenHeight/10))
        mdNavLabel.setup("Home", withTextColor:UIColor.whiteColor())
        navBar.addSubview(mdNavLabel)
        
        let mdView = MDView(frame:CGRectMake(0, (screenHeight/20)+navBar.frame.size.height, screenWidth, screenHeight/2.5))
        mdScrollView.addSubview(mdView)
        
        let distInView = mdView.frame.size.height/8
        
        let mdLabel = MDLabel(frame:CGRectMake(0, distInView/2, screenWidth, screenHeight/16))
        mdLabel.setup("Form", withTextColor:UIColor.blackColor())
        mdView.addSubview(mdLabel)
        
        let mdTextField = MDTextField(frame:CGRectMake(0, mdLabel.frame.origin.y+mdLabel.frame.size.height+distInView, screenWidth/2, screenHeight/12))
        mdTextField.center = CGPointMake(screenWidth/2, mdTextField.center.y)
        mdTextField.setup(UIColor.whiteColor(), withPlaceholder:" Enter Something!", withTextColor:UIColor.blackColor())
        mdView.addSubview(mdTextField)
        
        let mdRasiedBtn = MDButton(frame:CGRectMake(0, mdTextField.frame.origin.y+mdTextField.frame.size.height+distInView, screenWidth/2, screenHeight/14))
        mdRasiedBtn.center = CGPointMake(screenWidth/2, mdRasiedBtn.center.y)
        mdRasiedBtn.setup(mainColor, withText:"Tap me!", withTextColor:UIColor.whiteColor())
        mdView.addSubview(mdRasiedBtn)
        
        let mdSwitch = MDSwitch(frame:CGRectMake(0, mdView.frame.origin.y+mdView.frame.size.height+(screenHeight/20), 0, 0))
        mdSwitch.center = CGPointMake(screenWidth/2, mdSwitch.center.y)
        mdSwitch.setup(mainColor, shouldBeOn:true)
        mdScrollView.addSubview(mdSwitch)
        
        let distFromEdge = screenWidth/16
        let createBtnSize = screenWidth/7
        let createBtn = MDRoundButton(frame:CGRectMake(screenWidth-createBtnSize-distFromEdge, screenHeight-createBtnSize-distFromEdge, createBtnSize, createBtnSize))
        createBtn.setup(mainColor, withText:"+", withTextColor:UIColor.whiteColor())
        self.view.addSubview(createBtn)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

