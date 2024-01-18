//
//  RealmManager.swift
//  CredProtector
//
//  Created by bartek on 18/01/2024.
//

import Foundation
import RealmSwift

class RealmManager {
    func saveCredential(categoryTextField: String, name: String, login: String, password: String, category: CredCategory, realm: Realm) {
        if !categoryTextField.isEmpty {
            let newCategory = CredCategory()
            newCategory.title = categoryTextField
            let newCred = Credential()
            newCred.name = name
            newCred.login = login
            newCred.password = password
            newCategory.credentials.append(newCred)
            realm.add(newCategory)
        } else {
            let newCred = Credential()
            newCred.name = name
            newCred.login = login
            newCred.password = password
            category.credentials.append(newCred)
        }
    }
}
