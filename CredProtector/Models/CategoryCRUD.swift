//
//  RealmManager.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import Foundation
import RealmSwift

enum RealmError: Error {
    case invalidated
}

extension CredCategory {
    
    func save(for selectedCategory: String, name: String, login: String, password: String) throws {
        let realm = try Realm()
        guard let category = realm.objects(CredCategory.self).filter("title == %@", selectedCategory).first else {
            return
        }
        let newCred = Credential()
        newCred.name = name
        newCred.login = login
        newCred.password = password
        category.credentials.append(newCred)
        print("Added new credential \(newCred) to category \(selectedCategory)")
        
//        do {
//            try realm.write {
//                let newCred = Credential()
//                newCred.name = name
//                newCred.login = login
//                newCred.password = password
//                category.credentials.append(newCred)
//                print("Added new credential \(newCred) to category \(selectedCategory)")
//            }
//        } catch {
//            print("Error: \(error)")
//        }
    }
    
    func saveCred(for newCategoryTextField: String, name: String, login: String, password: String, realm: Realm) throws {        
        do {
            try realm.write {
                if !newCategoryTextField.isEmpty {
                    let newCategory = CredCategory()
                    let newCred = Credential()
                    newCred.name = name
                    newCred.login = login
                    newCred.password = password
                    newCategory.title = newCategoryTextField
                    newCategory.credentials.append(newCred)
                    credentials.append(newCred)
                    realm.add(newCategory)
                    print("Added new category: \(newCategory) with new credential \(newCred)")
                } else {
                    let newCred = Credential()
                    newCred.name = name
                    newCred.login = login
                    newCred.password = password
                    credentials.append(newCred)
                    print("Added new credential \(newCred) to all")
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
