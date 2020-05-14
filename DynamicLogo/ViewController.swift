//
//  ViewController.swift
//  DynamicLogo
//
//  Created by Abservetech on 13/05/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

enum ButtonType {
    case ios
    case android
    case flutter
}

class ViewController: UIViewController {

    @IBOutlet weak var iosBtn : UIButton!
    @IBOutlet weak var androidBtn : UIButton!
    @IBOutlet weak var flutterBtn : UIButton!
    
    @IBAction func iosBtnAction(_ sender: Any) {
//        self.alerNateicon(name: "")
//        let vc = PreviewViewController.initWithStory()
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func androidBtnAction(_ sender: Any) {
//         self.alerNateicon(name: "Android")
    }
    
    @IBAction func flutterBtnAction(_ sender: Any) {
//          self.alerNateicon(name: "Flutter")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalViewSetup()
        if traitCollection.forceTouchCapability == .available{
            registerForPreviewing(with: self, sourceView: self.view)
        }
        self.addDynamicShortcut()
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
    
    func addDynamicShortcut(){
        let firstShurtCutIcon = UIApplicationShortcutIcon(type: .play)
        let firstShurtCutItem = UIApplicationShortcutItem(type: "shortcut", localizedTitle: "Dynamic", localizedSubtitle: "shortcut", icon: firstShurtCutIcon, userInfo: nil)
        UIApplication.shared.shortcutItems = [firstShurtCutItem]
    }
    
   
}




extension ViewController : UIViewControllerPreviewingDelegate{
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
     
        let countyViewController = PreviewViewController.initWithStory()
        countyViewController.delegate = self
        countyViewController.preferredContentSize = CGSize(width: 0, height: 360)
        previewingContext.sourceRect = self.iosBtn.layer.bounds
        if location.y > 400 && location.y < 500{
            countyViewController.button = ButtonType.ios
        }else if location.y > 500 && location.y < 600{
            countyViewController.button = ButtonType.android
        }else if location.y > 600 && location.y < 700{
            countyViewController.button = ButtonType.flutter
        }
        return countyViewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
       let naigationController = UINavigationController(rootViewController: viewControllerToCommit)
        
        showDetailViewController(naigationController, sender: self)
    }
    
}

extension ViewController : PeekDelegate{
    func peekpop(logo: ButtonType) {
        let countyViewController = ConttextMenuViewController.initWithStory()
        countyViewController.button = logo
        self.present(countyViewController, animated: true, completion: nil)
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
