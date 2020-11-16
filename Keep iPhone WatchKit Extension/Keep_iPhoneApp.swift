//
//  Keep_iPhoneApp.swift
//  Keep iPhone WatchKit Extension
//
//  Created by Yoshiaki Aibara on 2020/11/17.
//

import SwiftUI

@main
struct Keep_iPhoneApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
