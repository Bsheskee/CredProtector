//
//  Category.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import Foundation
import RealmSwift

class CredCategory: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    
    @Persisted var credentials = RealmSwift.List<Credential>()

    override class func primaryKey() -> String? {
        return "id"
    }
    convenience init(title: String) {
        self.init()
        self.title = title
    }
    static func previewExample() -> CredCategory {
        CredCategory(title: "Category title")
    }
}
