//
//  ViewController.swift
//  JLSwiftProject
//
//  Created by UCS on 2017/8/17.
//  Copyright © 2017年 www.ucsdigital.com. All rights reserved.
//


//import SnapKit

import Alamofire

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.backgroundColor = UIColor.purple
//        print("123")
//        self.view.backgroundColor = UIColor.blue
//        let titleLabel = UILabel.init()
        
        let button:UIButton = UIButton(type: UIButtonType.contactAdd)
        button.frame = CGRect(x:100, y:100, width:100, height:100)
        //设置按钮的背景颜色
        button.backgroundColor = UIColor.cyan
        //设置按钮的背景图片
        button.setBackgroundImage(UIImage(named:"background"),for:.normal)
        //对于Custom定制类型按钮，代码可简化为：
//        let button1 = UIButton(frame: CGRect(x:100, y:100, width:100, height:100))
        //设置按钮文字
        button.setTitle("点我一下", for: UIControlState.normal)
        //设置button的点击事件
        button.addTarget(self, action: #selector(ViewController.clickButton(_sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        //请求数据
        self.testJson()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let url = String.init(format:"http://192.168.30.35:8080/mvm_order/support/applyRefund?orderId=10465" )
//        let urlStr = String.init(fo)
        
        NetManager.getData(url: url, parameters:nil) { (respose) in
            
            print("respose \(respose)")
            
            //            let dict = respose as! Dictionary<String,AnyObject>
            //            let body = dict["body"] as! Dictionary<String,AnyObject>
            //            let arr = body["list"] as! Array<Dictionary<String, Any>>
            //            for dictionary in arr {
            //                let model :Model  = Model.creatModel(dictionary: dictionary)
            //                self.dataArr.append(model)
            ////                self.myTableView.reloadData()
            //            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func clickButton(_sender: UIButton) -> Void{
        
        let secondNav = UINavigationController()
        
        //实例化一个将要跳转的viewController
        let secondView = SecondController()
        //跳转
//        self.navigationController?.pushViewController(secondView , animated: true)
        self .present(secondView, animated: true) {
            
        }
        
    }

    //测试json
    func testJson() {
        //Swift对象
        let user:[String: Any] = [
            "uname": "张三",
            "tel": ["mobile": "138", "home": "010"]
        ]
        //首先判断能不能转换
        if (!JSONSerialization.isValidJSONObject(user)) {
            print("is not a valid json object")
            return
        }
        
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: user, options: [])
        //Data转换成String打印输出
        let str = String(data:data!, encoding: String.Encoding.utf8)
        
        //输出json字符串
        print("Json Str:");print(str)
        
        //把Data对象转换回JSON对象
        let json = try? JSONSerialization.jsonObject(with: data!,
                                                     options:.allowFragments) as! [String: Any]
        print("Json Object:", json)
        
        //验证JSON对象可用性
        let uname = json?["uname"]
        let mobile = (json?["tel"] as! [String: Any])["mobile"]
        print("get Json Object:","uname: \(uname), mobile: \(mobile)")
        
    }
    
}


class NetManager: NSObject {
    /*
     get 请求
     */
    class func getData(url:String,parameters:Dictionary<String,Any>?,success:@escaping ((Any)->Void))  {
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (returnResult) in
            
            switch returnResult.result{
                
            case .success(let json):
                
                success(json)
                
            case .failure(let error):
                print("url 请求错误 \(url) \n error == \(error)")
                break;
            }
        }
    }/*
     post 请求
     */
    class func postData(url:String,parameters:Dictionary<String,Any>?,success:@escaping ((Any)->Void)){
        
        Alamofire.request(url, method:.post, parameters: parameters).responseJSON {(respose) in
            
            switch respose.result {
                
            case .success(let json):
                success(json)
                
            case .failure(let error):
                print("url 请求错误 \(url) \n error == \(error)")
            }
        }
    }
    
}



