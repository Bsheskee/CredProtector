//
//  CredsListManager.swift
//  CredsListManager
//
//  Created by bartek on 14/11/2023.
//

import Foundation

class CredsManager: ObservableObject {
    @Published var creds: [Credential] = [Credential(id: UUID(), name: "first"), Credential(id: UUID(), name: "second"), Credential(id: UUID(), name: "third")]
    
    init(isForTests: Bool = false) {
        if !isForTests {
            //get data set to creds array
        }
        
    }
    func move(indices: IndexSet, newOffset: Int) {
        creds.move(fromOffsets: indices, toOffset: newOffset)
    }
    func addCred() {
        creds.append(Credential(id: UUID(), name: "newly added"))
    }
    func deleteCred(indexSet: IndexSet) {
        for index in indexSet {
            creds.remove(at: index)
        }
    }
    static func emptyState() -> CredsManager {
        let manager = CredsManager(isForTests: true)
        manager.creds = []
        return manager
    }
    static func fullState() -> CredsManager {
        let manager = CredsManager(isForTests: true)
        manager.creds = [Credential(id: UUID(), name: "first"), Credential(id: UUID(), name: "second"), Credential(id: UUID(), name: "third")]
        return manager
    }
}

