//
//  CredProtectorApp.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI

@main
struct CredProtectorApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            InitialView()
        }
    }
}
