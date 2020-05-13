//
//  ViewController.swift
//  DynamicLogo
//
//  Created by Abservetech on 13/05/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iosBtn : UIButton!
    @IBOutlet weak var androidBtn : UIButton!
    @IBOutlet weak var flutterBtn : UIButton!
    
    @IBAction func iosBtnAction(_ sender: Any) {
        self.alerNateicon(name: "")
    }
    
    @IBAction func androidBtnAction(_ sender: Any) {
         self.alerNateicon(name: "Android")
    }
    
    @IBAction func flutterBtnAction(_ sender: Any) {
          self.alerNateicon(name: "Flutter")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalViewSetup()
    }
    
    func initalViewSetup(){
        [self.iosBtn,self.androidBtn,self.flutterBtn].forEach { (button) in
            button.setupConerRadiusButton()
        }
    }

func alerNateicon(name : String){
    if name.isEmpty{
        UIApplication.shared.setAlternateIconName(nil)
    }else{
        if UIApplication.shared.supportsAlternateIcons{
            UIApplication.shared.setAlternateIconName(name) { (error) in
                if let error = error{
                    print("Sorry we cont set that")
                }else{
                    print("Success")
                }
            }
            }
        }
    }
}

extension UIButton{
    func setupConerRadiusButton(){
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}

