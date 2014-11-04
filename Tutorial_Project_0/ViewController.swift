//
//  ViewController.swift
//  Tutorial_Project_0
//
//  Created by guafei on 14-10-21.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,RootViewDelegate,NSURLConnectionDataDelegate
{

    let rootView:RootView? = RootView()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initRootView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initRootView()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        rootView?.initViewWithFrame(self.view.frame)
        rootView?.delegate = self
        rootView?.demoClickBlock =
        {
            self.demoBtnClicked()
        }
        
        rootView?.networkBlock =
        {
            self.networkBlock()
        }
        
        self.view.addSubview(rootView!)
    }
    
    func demoBtnClicked()
    {
        var tableViewVC = TableViewController_Swift()
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.pushViewController(tableViewVC, animated: false)
    }
    
    func networkBlock()
    {
        var url:NSURL = NSURL(string: "http://127.0.0.1:8888/swift_json")!
        var request:NSURLRequest = NSURLRequest(URL: url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
//        assert(false, "test")
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
//        assert(false, "test")
        var error:NSError?
        var dic = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as NSDictionary
        var alert = UIAlertView(title: "username is", message: "", delegate: self, cancelButtonTitle: "cancel")
        alert.show()

    }
}

