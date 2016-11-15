//
//  ViewController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/14.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
  
    //MARK:--------------------------lazyloading-----------------------------
    /**
     创建tableView
    */
    lazy var tableView: UITableView = {
        
       let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain);
        return tableView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setNavUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     重写view
    */
    override func loadView()
    {
        let tableView = UITableView(frame: UIScreen.main.bounds, style:UITableViewStyle.plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        view = tableView;
    }
    
    /**
    */
    func setNavUI() -> Void
    {
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 44));
        let subTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 22));
        subTitleLabel.text = "主题发布";
        subTitleLabel.textAlignment = NSTextAlignment.center;
        subTitleLabel.textColor = UIColor.red;
        subTitleLabel.font = UIFont.systemFont(ofSize: 12.0);
        titleView.addSubview(subTitleLabel);
        self.navigationItem.titleView = titleView;
   
        return
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate
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
