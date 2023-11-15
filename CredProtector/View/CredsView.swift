//
//  CredsView.swift
//  Creds View
//
//  Created by bartek on 12/11/2023.
//

import SwiftUI
import Secrets

struct CredsView: View {
    @ObservedObject var credsManager: CredsManager
    let manager = SecretsManager(key: "12345")
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(credsManager.creds) { item in
                        NavigationLink(
                            destination: Text("Destination \(item.name)"),
                            label: {
                                Text(item.name)
                            })
                    }
                    .onDelete { indexSet in
                        credsManager.deleteCred(indexSet: indexSet)
                    }
                    .onMove { indices, newOffset in
                        credsManager.move(indices: indices, newOffset: newOffset)
                    }
                }
                if credsManager.creds.count == 0 {
                    Text("Start by adding your credentials")
                        .foregroundColor(.gray)
                        .padding(.bottom, 100)
                }
                if let secret = manager.readSecret() {
                    Text("The secret is: \(secret)")
                } else {
                    Text("Failed to read secret")
                }
            }
            .navigationTitle("Credentials")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        credsManager.addCred()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
//        UITabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CredsView(credsManager: CredsManager.emptyState())
            .previewDisplayName("empty state")
        CredsView(credsManager: CredsManager.fullState())
            .previewDisplayName("full state")
    }
}
