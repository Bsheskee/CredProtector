//
//  CategoryFilterView.swift
//  CredProtector
//
//  Created by bartek on 17/01/2024.
//

import SwiftUI
import RealmSwift

struct CategoryFilterView: View {
    @ObservedResults(CredCategory.self, sortDescriptor: SortDescriptor(keyPath: "title")) var categories
    @Binding var selectedCategory: String
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("All") // Special category representing all credentials
                    .frame(minWidth: 100)
                    .padding(6)
                    .foregroundColor(.white)
                    .background(selectedCategory == "All" ? .pink: .cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .onTapGesture {
                        selectedCategory = "All"
                    }
                
                ForEach(categories.filter { !$0.title.isEmpty }) { category in
                    Text(category.title)
                        .frame(minWidth: 100)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(selectedCategory == category.title ? .pink: .cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        .onTapGesture {
                            selectedCategory = category.title
                        }
                }
            }
        }
    }
}


struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(selectedCategory: Binding<String>.constant("All"))
    }
}
