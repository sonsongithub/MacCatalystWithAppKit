//
//  MacOSController.swift
//  MacOSBridge
//
//  Created by Yuichi Yoshida on 2022/05/13.
//

import Foundation
import Cocoa

class MacOSController: NSObject, iOS2Mac {
    
    var iOSController: mac2iOS?
    
    required override init() {
        super.init()
    }
    
    func openAlert() {
        let alert = NSAlert()
        alert.messageText = NSLocalizedString("Cocoa", comment: "")
        alert.informativeText = NSLocalizedString("Welcome to Cocoa", comment:"")
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        _ = alert.runModal()
    }
}
