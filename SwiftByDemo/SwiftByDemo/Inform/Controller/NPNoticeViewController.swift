//
//  NPNoticeViewController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/21.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPNoticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 20, y: 100, width: kScreenWidth-40, height: 200))
        imageView.image = UIImage.init(named: "wate_mark")?.waterMarkedImage(waterMarkText: "kingkamg")
        
        return imageView
    }()
}
