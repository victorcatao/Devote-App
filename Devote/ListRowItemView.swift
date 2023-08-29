//
//  ListRowItemView.swift
//  Devote
//
//  Created by Victor Catão on 26/08/23.
//

import SwiftUI

struct ListRowItemView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
 
    // MARK: - BODY
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .padding(.vertical, 4)
        .onReceive(item.objectWillChange) { _ in
            if viewContext.hasChanges {
                try? viewContext.save()
            }
        }
    }
}
