//
//  TableViewController_Swift.swift
//  Tutorial_Project_0
//
//  Created by guafei on 14-10-21.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

import Foundation
import UIKit

class TableViewController_Swift: UIViewController,UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate
{
    let tableView:UITableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initView()
        initDataSource()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initDataSource()
    {
        
    }
    
    func initView()
    {
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:TableViewCell_Swift = TableViewCell_Swift()
        cell.initTableViewCell()
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as? TableViewCell_Swift
        var alert = UIAlertView(title: "number is", message: cell?.number.text, delegate: self, cancelButtonTitle: "cancel")
        alert.show()
    }
    
}