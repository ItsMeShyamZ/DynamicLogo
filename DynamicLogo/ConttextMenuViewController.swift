//
//  ConttextMenuViewController.swift
//  DynamicLogo
//
//  Created by Abservetech on 14/05/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class ConttextMenuViewController: UIViewController {
    
    
    @IBOutlet weak var iconImage : UIImageView!
    
    var button : ButtonType = .ios
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch button {
        case .ios:
            self.iconImage.image = UIImage(named: "ios_logo.png")
            break
        case .android:
            self.iconImage.image = UIImage(named: "android_logo.png")
            break
        case .flutter:
            self.iconImage.image = UIImage(named: "flutter_logo.png")
            break
        default: break
            
        }
        iconImage.isUserInteractionEnabled = true
        let interaction = UIContextMenuInteraction(delegate: self)
        self.iconImage.addInteraction(interaction)
        
        
//        let config = UIContextMenuConfiguration(identifier: "myid" as NSCopying, previewProvider: {
//            return nil
//        }, actionProvider: { sugg in
//            return nil
//        })
        
        
        
    }
    
    class func initWithStory() -> ConttextMenuViewController{
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConttextMenuViewController") as! ConttextMenuViewController
         return vc
         
     }
}

extension ConttextMenuViewController : UIContextMenuInteractionDelegate{
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
         let favorite = UIAction(title: "ChangeLogo",
                 image: UIImage(systemName: "heart.fill")) { action in
//                     UIApplication.shared.setAlternateIconName(name)
                    switch self.button {
                           case .ios:
                             UIApplication.shared.setAlternateIconName("")
                             
                               break
                           case .android:
                               UIApplication.shared.setAlternateIconName("Android")
                               break
                           case .flutter:
                               UIApplication.shared.setAlternateIconName("Flutter")
                               break
                           default: break
                               
                           }
               }

               let share = UIAction(title: "Share",
                 image: UIImage(systemName: "square.and.arrow.up.fill")) { action in
                 // Perform action
               }
               
               let delete = UIAction(title: "Delete",
                 image: UIImage(systemName: "trash.fill"),
                 attributes: [.destructive]) { action in
                 // Perform action
               }
               
               return UIContextMenuConfiguration(identifier: nil,
                 previewProvider: nil) { _ in
                 UIMenu(title: "Actions", children: [favorite, share, delete])
               }
               
    }
    
    
}
