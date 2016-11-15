//
//  NPHomeViewController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/15.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPHomeViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpUI();
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

    /**
     重写view
     */
    override func loadView()
    {
        view = tableView;
    }
    
    //MARK:----------------------------initUI----------------------------------
    /**
     设置UI
     */
    func setUpUI() -> Void
    {
        self.navigationItem.titleView = titleView;
        //self.navigationItem.rightBarButtonItem = rightItem;
        self.navigationItem.rightBarButtonItems = rightItems;
        return
    }
    
    //MARK:--------------------------lazyloading-----------------------------
    /**
     创建tableView
     */
    lazy var tableView: UITableView =
        {
            
            let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain);
            tableView.dataSource = self;
            tableView.delegate = self;
            return tableView;
    }();

    /**
     创建导航标题
    */
    lazy var titleView: UIView = {
     
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 44));
        let subTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 22));
        subTitleLabel.text = "主题发布";
        subTitleLabel.textAlignment = NSTextAlignment.center;
        subTitleLabel.textColor = UIColor.red;
        subTitleLabel.font = UIFont.systemFont(ofSize: 12.0);
        titleView.addSubview(subTitleLabel);

        return titleView;
    }();
    
    /**
     创建导航右侧试图
   
    lazy var rightItem: UIBarButtonItem = {
        let rightBtn = UIButton.init(type: UIButtonType.custom);
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 44);
        rightBtn.setTitle("兴趣", for: UIControlState.normal);
        rightBtn.setTitleColor(UIColor.red, for: UIControlState.normal);
        rightBtn.addTarget(self,action:#selector(buttonAtion(_:)),for:.touchUpInside);
        let rightItem = UIBarButtonItem.init(customView: rightBtn);
        return rightItem;
    }()
    */
    
    lazy var rightItems: [UIBarButtonItem] = {
        
        let rightBtn = UIButton.init(type: UIButtonType.custom);
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 44);
        rightBtn.setTitle("兴趣", for: UIControlState.normal);
        rightBtn.setTitleColor(UIColor.red, for: UIControlState.normal);
        rightBtn.addTarget(self,action:#selector(buttonAtion(_:)),for:.touchUpInside);
        let rightItem = UIBarButtonItem.init(customView: rightBtn);
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        spacer.width = -10;
    
        let rightItems = [spacer, rightItem];
        return rightItems as! [UIBarButtonItem];
    }()
    //MARK:------------------------Event resopond-----------------------
    /**
     兴趣触发事件
    */
    func buttonAtion(_ sender:UIButton)
    {
        print(#function);
        self.performSegue(withIdentifier: "segueToInterest", sender: nil);
    }
}



extension NPHomeViewController: UITableViewDataSource, UITableViewDelegate
{
    //MARK:--------------------------UITableViewDataSource-----------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentify = "cellIdentify";
        var tableviewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentify);
        if (tableviewCell == nil)
        {
            tableviewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentify);
        }
        tableviewCell?.textLabel?.text = String(format: "%d", indexPath.row);
        return tableviewCell!;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }
}
