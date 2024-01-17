//
//  AddCredView.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct AddCredView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var login = ""
    @State private var password = ""
    @State private var selectedCategory: String?
    @State private var categoryTextField = ""
    @ObservedResults(CredCategory.self, sortDescriptor: SortDescriptor(keyPath: "title")) var categories
    @ObservedRealmObject var category: CredCategory
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    TextField("Name of credential", text: $name)
                        .autocorrectionDisabled(true)
                        .accessibilityIdentifier("credName")
                    TextField("Login", text: $login)
                        .autocorrectionDisabled(true)
                        .accessibilityIdentifier("credLogin")
                    TextField("Password", text: $password)
                        .autocorrectionDisabled(true)
                        .accessibilityIdentifier("credPassword")
                }
                Section {
                    TextField("New group", text: $categoryTextField)
                        .accessibilityIdentifier("credGroup")
        
                    Button {
                        //tutaj: zacznij od nowa, od najbanalniejszych sposobów zapisu tego gówna
 
                        dismiss()
                    } label: {
                        Text("Save")
                            .frame(maxWidth: .infinity, maxHeight: 30)
                    }
                    .disabled(name.isEmpty && login.isEmpty && password.isEmpty)
                    .accessibility(identifier: "saveTapped")
                }
            }
            VStack {
//                LazyGrid(selectedCategory: $selectedCategory, categories: $categories)
                
            }
            .navigationTitle("New credential")
        }
    }
}

struct AddCredView_Previews: PreviewProvider {
    static var previews: some View {
        AddCredView(category: CredCategory())
    }
}
