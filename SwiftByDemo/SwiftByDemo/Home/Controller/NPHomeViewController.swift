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
        NotificationCenter.default.addObserver(self, selector: #selector(menuChange(_:)), name: NSNotification.Name(rawValue: kTitleMenuWillShow), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuChange(_:)), name: NSNotification.Name(rawValue:kTitleMenuWillDiss), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "segueToInterest")
        {
            let destionViewController = segue.destination as! NPInterestViewController;
            destionViewController.delegate = self;
        }

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    /**
     重写view
     */
    override func loadView()
    {
        view = tableView;
    }
    
    //MARK:----------------------------initUI----------------------------------
    /**
     设置导航UI
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
     
         //上方主题
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 64));
        let subTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 5, width: 100, height: 22));
        subTitleLabel.text = "主题发布";
        subTitleLabel.textAlignment = NSTextAlignment.center;
        subTitleLabel.textColor = UIColor(netHex: kColorIconyYellow, alpha: 1)
;
        subTitleLabel.font = UIFont.systemFont(ofSize: 12.0);
        titleView.addSubview(subTitleLabel);

        //下方菜单
        let titleMenu = NPTitleButton()
        titleMenu.frame = CGRect.init(x: 0, y: 20, width: 100, height: 30)
        titleMenu.setImage(#imageLiteral(resourceName: "arrow_up"), for: UIControlState.normal)
        titleMenu.setImage(#imageLiteral(resourceName: "arrow_down"), for: UIControlState.selected)
        titleMenu.setTitle("kingkamg", for: UIControlState.normal)
        titleMenu.setTitle("kingkamg", for: UIControlState.selected)
        titleMenu.setTitleColor(UIColor(netHex: kColorIconyYellow, alpha: 1)
, for: UIControlState.normal)
        titleMenu.setTitleColor(UIColor(netHex: kColorIconyYellow, alpha: 1)
, for: UIControlState.highlighted)
        titleMenu.addTarget(self, action:#selector(NPHomeViewController.menuAction(_:)), for: UIControlEvents.touchUpInside)
        titleView.addSubview(titleMenu)
       
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
        
        /*
        let rightBtn = UIButton.init(type: UIButtonType.custom);
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 44);
        rightBtn.setTitle("兴趣", for: UIControlState.normal);
        rightBtn.setTitleColor(UIColor.red, for: UIControlState.normal);
        rightBtn.addTarget(self,action:#selector(buttonAtion(_:)),for:.touchUpInside);
        let rightItem = UIBarButtonItem.init(customView: rightBtn);
        */
        let rightItem = self.createBarButtonItem(title:"兴趣", target:self, action:#selector(buttonAtion(_:)))
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        spacer.width = -10;
    
        let rightItems = [spacer, rightItem];
        return rightItems;
    }()
    
    lazy var popovAnimation: NPPopovAnimation = {
        let papovAnimation = NPPopovAnimation()
        return papovAnimation
    }()
    //MARK:------------------------custom fucntion---------------------
   /**
     创建barbaritem
     */
   fileprivate func createBarButtonItem(title: String, target: AnyObject, action:Selector) -> UIBarButtonItem
     {
        let btn = UIButton.init(type: UIButtonType.custom);
        btn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 44);
        btn.setTitle(title, for: UIControlState.normal);
        btn.setTitleColor(UIColor(netHex: kColorIconyYellow, alpha: 1)
, for: UIControlState.normal);
        btn.addTarget(self,action:action,for:.touchUpInside);
        return UIBarButtonItem.init(customView: btn);
    }
    //MARK:------------------------Event resopond-----------------------
    /**
     兴趣触发事件
    */
    func buttonAtion(_ sender:UIButton)
    {
        print("buttontitle = \(sender.titleLabel?.text)");
        self.performSegue(withIdentifier: "segueToInterest", sender: nil)
    }
    
    func menuAction(_ sender:UIButton)
    {
        print("\(#function)")
        //sender.isSelected = !(sender.isSelected)
//        if sender.isSelected == false
//        {
//            sender.isSelected = true
//        }
//        else
//        {
//            sender.isSelected = false
//        }
        //self.performSegue(withIdentifier: "modeSearch", sender: nil)
        let sortVC = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "modelSort")
        sortVC.transitioningDelegate = popovAnimation
        sortVC.modalPresentationStyle = UIModalPresentationStyle.custom
        self.present(sortVC, animated: true, completion: nil)
    }
    
    func menuChange(_ note:Notification)
    {
        let useInfo = note.userInfo as! [String:Any]
        let name = useInfo["name"]
        let bext = useInfo["bExt"]
        print("result =\(name),\(bext)")
        for item in (navigationItem.titleView?.subviews)!
        {
            if item.isKind(of: UIButton.self)
            {
               (item as! UIButton).isSelected = !(item as! UIButton).isSelected
            }
        }
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


extension NPHomeViewController: interestDelegate
{
    
    ///实现interestDelegate函数
    ///
    /// - Parameters:
    ///   - viewController: <#viewController description#>
    ///   - dataArray: <#dataArray description#>
    func chooseInterest(viewController: NPInterestViewController, dataArray: [[String : String]])
    {
        
        for item in dataArray 
        {
            print("name =\(item["name"]!) and ImageName =\(item["imageName"]!)");
//            if let dataDict = item as?[String:String]
//            {
//                print("\(dataDict["name"])");
//            }
            
//            for (key,value) in item
//            {
//                print("\(key),\(value)")
//            }
            
        }
//        let dict = ["name":"key name","name1":"key1 name","name2":"key 2 name"]
//        for key in dict{
//            print(key)
//        }
//        var dict = ["name":"jinpangpang","age":"16"]
//        for (key,value) in dict
//        {
//        print("\(key),\(value)")
//          }
    }
}

