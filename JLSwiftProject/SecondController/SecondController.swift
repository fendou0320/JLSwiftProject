//
//  SecondController.swift
//  JLSwiftProject
//
//  Created by UCS on 2017/11/16.
//  Copyright © 2017年 www.ucsdigital.com. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //创建一个文本标签并设置它的frame
        let label = UILabel(frame: CGRect(x:10, y:50, width:200, height:200))
        //设置文本标签的字体颜色为黑色
        label.textColor = UIColor.black
        //设置文本标签的文字
        label.text = "我是萌萌哒"
        //设置文本标签的文本显示位置为居中，还可以居左(Left)、居右(Right)、合乎情理的(Justified)、自然的(Natural)
        label.textAlignment = .center
        //自适应字体大小
        label.adjustsFontSizeToFitWidth = true
        //设置字体大小
        label.font = UIFont.boldSystemFont(ofSize: 12)
        //文本行数，为0就是自动换行
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        //lineBreakMode属性的枚举下面会详细介绍
        //是否能和用户交互
        label.isUserInteractionEnabled=true
        //文字是否可变，默认值是true
        label.isEnabled=true;
        //设置阴影颜色和偏移量
        label.shadowColor = UIColor.blue
        label.shadowOffset = CGSize(width:0.5, height:0.5)
        //设置是否高亮和高亮颜色
        label.isHighlighted = true
        label.highlightedTextColor = UIColor.red
        
        self.view.addSubview(label)
        
        self.view.backgroundColor = UIColor.white
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
