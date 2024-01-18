//
//  CredsListView.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct CredsListView: View {
    @State private var showAddCred = false
    @State private var selectedCategory: String = "All"
    @ObservedRealmObject var category: CredCategory
    @ObservedResults(CredCategory.self, sortDescriptor: SortDescriptor(keyPath: "title")) var categories
    
    var items: [Credential] {
        if selectedCategory == "All" || selectedCategory == "" {
            return Array(category.credentials)
        } else if let selectedCategory = categories.first(where: { $0.title == selectedCategory }) {
            return Array(selectedCategory.credentials)
        }
        return []
    }

    var body: some View {
        NavigationStack {
            CategoryFilterView(selectedCategory: $selectedCategory)
            if items.isEmpty {
                Text("Your credentials will be displayed here")
            }
            List {
                ForEach(items) { item in
                    CredentialRow(cred: item)
                }
                .onMove(perform: $category.credentials.move) //restructure to custom move and custom edit if needed
                .onDelete(perform: $category.credentials.remove) //restructure to custom delete and custom swipe
            }
            .navigationTitle("Credentials")
            .sheet(isPresented: $showAddCred) {
                AddCredView(category: category)
            }
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: { showAddCred.toggle() }) {
                        Image(systemName: "plus").font(.none).tint(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .accessibility(identifier: "showAddCredView")
                }
            }
        }
    }
}

struct CredsListView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCredential = Credential()
        dummyCredential.login = "Dummy Login"
        dummyCredential.password = "Dummy Password"
        dummyCredential.name = "Cred title"
        
        let dummyCategory = CredCategory(title: "category title")
        dummyCategory.credentials.append(dummyCredential)
        
        return CredsListView(category: dummyCategory)
    }
}
