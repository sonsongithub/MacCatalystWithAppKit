//
//  AppDelegate.swift
//  MacCatalystWithAppKit
//
//  Created by Yuichi Yoshida on 2022/05/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, mac2iOS {

    @objc func getHomeUUID() -> UUID {
        return UUID()
    }
    
    var macOSController: iOS2Mac?
    
    func openAlert(message: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let window = windowScene.keyWindow else { return }
        if let viewController = window.rootViewController as? ViewController {
            let alert = UIAlertController(title: "from AppKit", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: true)
            }))
            viewController.present(alert, animated: true)
        }
    }
    
    func loadBundle() {
        let bundleFile = "MacOSBridge.bundle"

        guard let bundleURL = Bundle.main.builtInPlugInsURL?.appendingPathComponent(bundleFile) else {
            print("Failed to create bundle URL.")
            return
        }
        guard let bundle = Bundle(url: bundleURL) else {
            print("Failed to load a bundle file.")
            return
        }
        guard let pluginClass = bundle.principalClass as? iOS2Mac.Type else {
            print("Failed to load the principalClass.")
            return
        }
        macOSController = pluginClass.init()
        macOSController?.iOSController = self
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadBundle()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

