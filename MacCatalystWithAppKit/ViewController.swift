//
//  ViewController.swift
//  MacCatalystWithAppKit
//
//  Created by Yuichi Yoshida on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pushButton(sender: Any?) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.macOSController?.openAlert(message: "UIKitからこんにちは")
        }
//        
//        let alert = UIAlertController(title: "test", message: "from UIKit", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//            alert.dismiss(animated: true)
//        }))
//        self.present(alert, animated: true)
    }
}

