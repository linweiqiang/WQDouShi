//
//  BaseNavigationViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override class func initialize(){
        super.initialize()
        setUpNavAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension BaseNavigationViewController
{
    fileprivate class func setUpNavAppearance(){
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = UIColor(r: 39, g: 105, b: 187)
        navBarAppearance.tintColor = UIColor.orange
        
        var titleTextAttributes = [String : Any]()
        titleTextAttributes[NSForegroundColorAttributeName] =  UIColor.orange
        titleTextAttributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-CondensedBlack", size: 19)
        navBarAppearance.titleTextAttributes = titleTextAttributes
        
    }
}
