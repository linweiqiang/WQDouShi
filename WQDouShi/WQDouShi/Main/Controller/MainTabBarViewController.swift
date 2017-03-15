//
//  MainTabBarViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavRootViewControllers(vc: HomeViewController(), title: "首页", image: "home", selImage: "home")
        
        setUpNavRootViewControllers(vc: MusicViewController(), title: "音乐", image: "songList_normal", selImage: "songList_highLighted")
        setUpNavRootViewControllers(vc: DiscoverViewController(), title: "发现", image: "find", selImage: "find")
        
        setUpNavRootViewControllers(vc: MineViewController(), title: "我的", image: "user", selImage: "user")
        
    }
}

extension MainTabBarViewController
{
    fileprivate func setUpNavRootViewControllers(vc: UIViewController, title:String, image: String, selImage: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage.mg_RenderModeOriginal(imageName: selImage)
        
        self.addChildViewController(BaseNavigationViewController(rootViewController: vc))
    }
}
