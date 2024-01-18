//
//  CredentialRow.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct CredentialRow: View {
    @ObservedRealmObject var cred: Credential
    
    var body: some View {
        NavigationLink(destination: CredDetailView(cred: cred)) {
            HStack(spacing: 20) {
                Text(cred.name)
            }
        }
        
    }
}

struct CredentialRow_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCredential = Credential()
        dummyCredential.login = "Dummy Login"
        dummyCredential.password = "Dummy Password"
        dummyCredential.name = "Cred title"
        
        return CredentialRow(cred: dummyCredential)
    }
}
