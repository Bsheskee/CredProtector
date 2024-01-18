//
//  RealmManager.swift
//  CredProtector
//
//  Created by bartek on 18/01/2024.
//

import Foundation
import RealmSwift

class RealmManager {
    func saveCredential(categoryTextField: String, name: String, login: String, password: String, selectedCategory: String, realm: Realm) {
        if !categoryTextField.isEmpty {
            saveCredential_toNew(categoryTextField: categoryTextField, name: name, login: login, password: password, realm: realm)
            saveCredential_toAll(name: name, login: login, password: password, realm: realm)
        } else {
            saveCredential_toAll(name: name, login: login, password: password, realm: realm)
            saveCredential_toSelected(name: name, login: login, password: password, selectedCategory: selectedCategory, realm: realm)
        }
        
    }
    func saveCredential_toNew(categoryTextField: String, name: String, login: String, password: String, realm: Realm) {
        let newCategory = CredCategory()
        newCategory.title = categoryTextField
        let newCred = Credential()
        newCred.name = name
        newCred.login = login
        newCred.password = password
        newCategory.credentials.append(newCred)
        realm.add(newCategory)
    }
    
    func saveCredential_toAll(name: String, login: String, password: String, realm: Realm) {
        guard let allCategory = realm.objects(CredCategory.self).filter("title == %@", "All").first else {
            return
        }
        let newCred = Credential()
        newCred.name = name
        newCred.login = login
        newCred.password = password
        allCategory.credentials.append(newCred)
    }
    
    func saveCredential_toSelected(name: String, login: String, password: String, selectedCategory: String, realm: Realm) {
        guard let categorySelected = realm.objects(CredCategory.self).filter("title == %@", selectedCategory).first else {
            return
        }
        let newCred = Credential()
        newCred.name = name
        newCred.login = login
        newCred.password = password
        categorySelected.credentials.append(newCred)
    }
    
}
