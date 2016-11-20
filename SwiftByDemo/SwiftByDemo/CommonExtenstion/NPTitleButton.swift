//
//  NPTitleButton.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/19.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPTitleButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews()
    {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.bounds.width)!
    }
}
