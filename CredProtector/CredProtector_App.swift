//
//  CredProtector_App.swift
//  CredProtector App
//
//  Created by bartek on 12/11/2023.
//

import SwiftUI

@main
struct CredProtector_App: App {
    @StateObject var credsManager = CredsManager()
    
    var body: some Scene {
        WindowGroup {
            CredsView(credsManager: credsManager)
        }
    }
}
