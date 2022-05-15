//
//  SharedProtocol.swift
//  MacCatalystWithAppKit
//
//  Created by Yuichi Yoshida on 2022/05/13.
//

import Foundation

@objc(iOS2Mac)
public protocol iOS2Mac: NSObjectProtocol {
    init()
    func openAlert()
    var iOSController: mac2iOS? { get set }
}

@objc(mac2iOS)
public protocol mac2iOS: NSObjectProtocol {
    func getHomeUUID() -> UUID
}
