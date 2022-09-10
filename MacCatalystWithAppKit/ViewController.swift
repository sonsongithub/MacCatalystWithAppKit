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
            appDelegate.macOSController?.openNSAlert(message: "UIKitからこんにちは")
        }
    }
}

