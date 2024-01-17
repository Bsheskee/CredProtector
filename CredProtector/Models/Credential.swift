//
//  Credential.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import RealmSwift
import Realm

class Credential: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var login: String
    @Persisted var password: String
    @Persisted(originProperty: "credentials") var category: LinkingObjects<CredCategory>
        
    override class func primaryKey() -> String? {
        "id"
    }
    convenience init(name: String, login: String, password: String) {
        self.init()
        self.name = name
        self.login = login
        self.password = password
    }
    
    static func previewExample() -> Credential {
        Credential(name: "Bitwarden", login: "nazwa@gmail.com", password: "12345678")
    }
}
