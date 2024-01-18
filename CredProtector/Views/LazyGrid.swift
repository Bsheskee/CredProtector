//
//  LazyGrid.swift
//  CredProtector
//
//  Created by bartek on 18/01/2024.
//

import SwiftUI
import RealmSwift

struct LazyGrid: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @Binding var selectedCategory: String?
    @ObservedResults(CredCategory.self, sortDescriptor: SortDescriptor(keyPath: "title")) var categories

    
    var body: some View {
        let categoryTitles = categories.map { $0.title }
        LazyVGrid(columns: columns) {
            ForEach(categoryTitles, id: \.self) { title in
                Text(title)
                    .padding()
                    .frame(width: 80.0, height: 30)
                    .background(selectedCategory == title ? .pink: .cyan)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .onTapGesture {
                        selectedCategory = title
                    }
            }
        }.padding()
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid(selectedCategory: .constant("All"))
    }
}
