//
//  SocialNetworkApp.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 19/02/2025.
//

import SwiftData
import SwiftUI

@main
struct SocialNetworkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
