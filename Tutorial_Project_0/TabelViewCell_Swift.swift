//
//  TabelViewCell_Swift.swift
//  Tutorial_Project_0
//
//  Created by guafei on 14-10-21.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

import Foundation
import UIKit

let CELL_HEIGHT:CGFloat = 150.0

class TableViewCell_Swift:UITableViewCell
{
    var name: UILabel = UILabel()
    var number: UILabel = UILabel()
    
    func initTableViewCell()
    {
        self.frame = CGRectMake(0, 0, SCREEN_BOUNDS.size.width, CELL_HEIGHT)
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        var image = UIImage(named:"Avatar.jpeg")
        var imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(20, 20, 100, 100)
        
        name = UILabel(frame: CGRectMake(140, 20, SCREEN_BOUNDS.size.width - 140, 50))
        number = UILabel(frame: CGRectMake(140, 70, SCREEN_BOUNDS.size.width - 140, 50))
        name.text = "Fico"
        number.text = "13625814876"
        
        self.addSubview(imageView)
        self.addSubview(name)
        self.addSubview(number)
    }

}