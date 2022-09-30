//
//  Unf1owApp.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI
import UnflowUI

@main
struct Unf1owApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        UnflowAppearanceManager.configureAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    var client: UnflowSDK?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // Initialise the app with your own key to see your content in the F1 style.
        client = UnflowSDK.initialize(
            config: UnflowSDK.Config(
                apiKey: "c091c77828570d62a41ce260a81fe244",
                enableLogging: true
            )
        )

        // Set your own custom fonts inside the unflow semantic type system.
        client?.setCustomFonts(
            fonts: .init(
                title: UIFont(name: "Titillium Web SemiBold", size: 33),
                body: UIFont(name: "Titillium Web SemiBold", size: 16)
            )
        )

        // Perform our initial sync
        client?.sync()

        return true
    }
}
