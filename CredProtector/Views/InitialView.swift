//
//  ContentView.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct InitialView: View {
    @ObservedResults(CredCategory.self) var categories

    
    var body: some View {
        VStack {
            if let category = categories.first {
                CredsListView(category: category)
            } else {
                ProgressView()
                    .onAppear {
                        $categories.append(CredCategory())
                    }
            }
        }
        .padding()
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
