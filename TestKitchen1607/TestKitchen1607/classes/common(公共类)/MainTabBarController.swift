//
//  MainTabBarController.swift
//  TestKitchen1607
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
//import SnapKit

class MainTabBarController: UITabBarController {
    //tabbar的背景
    private var bgView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建视图控制器
        createViewControllers()
        createMyTabBar()
        view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMyTabBar() {
        //1.创建背景视图
        bgView = UIView.creatView()
        bgView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        //设置边框
//        bgView!.layer.borderColor = UIColor.blackColor().CGColor
//        bgView!.layer.borderWidth = 1
        view.addSubview(bgView!)
        
        bgView?.snp_makeConstraints(closure: { [weak self](make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        })
        
        tabBar.hidden = true
        let imageNames = ["home","community","shop","shike","mine"]
        //标题文字
        let  titles = ["食材","社区","商城","食课","我的"]
        //循环创建按钮
        let width = kScreenW/CGFloat(imageNames.count)
        for i in 0..<imageNames.count {
            let imageName = imageNames[i]+"_normal"
            let selecName = imageNames[i]+"_select"
            let btn = UIButton.creatBtn(nil, bgImageName: imageName, highlightImageName: nil, selectImageName: selecName, target: self, action: #selector(ClickBtn(_:)))
            //设置tag值
            btn.tag = 300+i
            bgView?.addSubview(btn)
            //设置位置
            btn.snp_makeConstraints(closure: { [unowned self](make) in
                make.top.bottom.equalTo(self.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })
            //2.2 显示标题
            let titleLabel = UILabel.creatLabel(titles[i], textAlignment: .Center, font: UIFont.systemFontOfSize(10))
            btn.addSubview(titleLabel)
            
            //设置位置
            titleLabel.snp_makeConstraints(closure: { (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(20)
            })
        }
        
    }
    func ClickBtn(curBtn:UIButton) {
        let index = curBtn.tag-300
        
        if selectedIndex != index {
            //1.1取消选中之前的按钮
            let lastBtn = bgView?.viewWithTag(300+selectedIndex) as! UIButton
            lastBtn.selected = false
            lastBtn.userInteractionEnabled = true
            //1.2选中当前的按钮
            curBtn.selected = true
            
            //1.3切换视图控制器
            selectedIndex = index

        }
        
    }
    
    //创建视图控制器
    
    //创建视图控制器
    func createViewControllers() {
        
        //视图控制器的名字
        let nameArray = ["IngredientViewController","ComnunityViewController","MallViewController","FoodClassViewController","MyViewController"]
        
        
        //视图控制器对象的数组
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<nameArray.count {
            
            let name = "TestKitchen1607."+nameArray[i]
            
            //使用类名创建类的对象
            let ctrl = NSClassFromString(name) as! UIViewController.Type
            
            let vc = ctrl.init()
            
            //导航
            let navCtrl = UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        
        viewControllers = ctrlArray
    }

    /*func creatViewController() {
        let nameArray = ["TestKitchen1607.IngredientViewController","TestKitchen1607.ComnunityViewController","TestKitchen1607.MallViewController","TestKitchen1607.FoodClassViewController","TestKitchen1607.MyViewController"]
        //图片的名字
        let imageNames = ["home","community","shop","shike","mine"]
        //标题文字
        let  titles = ["食材","社区","商城","食课","我的"]
        //视图控制器对象的数组
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<nameArray.count {
            //使用类名创建类的对象
            let ctrl = NSClassFromString(nameArray[i]) as! UIViewController.Type
            let vc = ctrl.init()
            //设置图片和文字
            vc.tabBarItem.title = titles[i]
            let imageName = imageNames[i]+"_normal"
            vc.tabBarItem.image = UIImage(named: imageName)
            let selectName = imageNames[i]+"_select"
            vc.tabBarItem.selectedImage = UIImage(named: selectName)
            //导航
            let navCtrl = UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        viewControllers = ctrlArray
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
