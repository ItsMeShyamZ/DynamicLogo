//
//  PreviewViewController.swift
//  DynamicLogo
//
//  Created by Abservetech on 14/05/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

protocol PeekDelegate {
    func peekpop(logo : ButtonType)
}

class PreviewViewController: UIViewController {

    @IBOutlet weak var iconImage : UIImageView!
    var delegate : PeekDelegate?
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
            
    }
    
    class func initWithStory() -> PreviewViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        return vc
    }
    
    override var previewActionItems : [UIPreviewActionItem] {
            
            let likeAction = UIPreviewAction(title: "Go ContextMenu VC", style: .default) { (action, viewController) -> Void in
                self.delegate?.peekpop(logo: self.button)
            }
            
            let deleteAction = UIPreviewAction(title: "Delete..", style: .destructive) { (action, viewController) -> Void in
                print("You clicked this too")
            }
            
            return [likeAction, deleteAction]
            
        }

}
