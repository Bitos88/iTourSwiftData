//
//  iTourSwiftDataApp.swift
//  iTourSwiftData
//
//  Created by Alberto Alegre Bravo on 3/10/23.
//

import SwiftData
import SwiftUI

@main
struct iTourSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
