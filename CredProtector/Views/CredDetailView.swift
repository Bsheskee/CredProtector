//
//  CredDetailView.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct CredDetailView: View {
    @State private var isPresented: Bool = false
    @ObservedRealmObject var cred: Credential

    var body: some View {
            VStack {
                Text(cred.login)
                Text(cred.password)
                    .padding()
                Button {
                    //action
                } label: {
                    Text("Add field")
                }
                .navigationTitle(cred.name)
            }
    }
}

struct CredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CredDetailView(cred: Credential.previewExample())
        }
    }
}

