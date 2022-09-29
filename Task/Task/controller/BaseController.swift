//
//  BaseController.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import UIKit

class BaseController: UIViewController {

    var toolbar = ToolbarView()
    
    func setToolbar(title: String, haveBack: Bool = false){
        
        self.view.backgroundColor = UIColor(hexString: "#F7F5FFFF")
        
        toolbar = ToolbarView(frame: CGRect(x: 0,y: 0,width: self.view.frame.width, height: self.view.frame.height * 0.12))
        toolbar.haveBack = haveBack
        toolbar.title = title
       
        toolbar.menuBtn.addTarget(self, action: #selector(self.menuBtnClick), for: .touchUpInside)
        toolbar.profileBtn.addTarget(self, action: #selector(self.profileBtnClick), for: .touchUpInside)
        toolbar.backBtn.addTarget(self, action: #selector(self.backBtnClick), for: .touchUpInside)
       
        self.view.addSubview(toolbar)
        
    }
    @objc func profileBtnClick(){
       print("profile button click")
    }
    
    @objc func menuBtnClick(){
       print("menu button click")
    }
    
    @objc func backBtnClick(){
        dismiss(animated: true, completion: nil)
    }

}
