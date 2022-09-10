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
    
    func openNSAlert(message: String) {
        let alert = NSAlert()
        alert.messageText = NSLocalizedString("NSAlertだよ", comment: "")
        alert.informativeText = NSLocalizedString(message, comment:"")
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Close")
        alert.addButton(withTitle: "Open Alert of UIKit")
        
        switch alert.runModal() {
        case .alertFirstButtonReturn:
            break
        case .alertSecondButtonReturn:
            if let mac2iOS = self.iOSController {
                mac2iOS.openUIAlert(message: "AppKitからこんにちは")
            }
            break
        default:
            break
        }
    }
}
