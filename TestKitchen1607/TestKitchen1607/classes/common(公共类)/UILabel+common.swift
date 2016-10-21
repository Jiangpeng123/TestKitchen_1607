//
//  UILabel+common.swift
//  TestKitchen1607
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    class func creatLabel(text:String?,textAlignment:NSTextAlignment?,font:UIFont?) -> UILabel {
        let label = UILabel()
        if let tmpText = text {
            label.text = tmpText
        }
        if let tmpAlignment = textAlignment {
            label.textAlignment = tmpAlignment
        }
        if let tmpFont = font {
            label.font = tmpFont
        }
        return label
    }
}



