//
//  ContentView.swift
//  iTourSwiftData
//
//  Created by Alberto Alegre Bravo on 3/10/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    //    @Query(sort: [SortDescriptor(\Destination.name, order: .forward),
    //                  SortDescriptor(\Destination.priority, order: .reverse)]) var destinations: [Destination]
    
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: { destination in
                    EditDestinationView(destination: destination)
                })
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date, order: .reverse))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addDestination() {
        let newDestination = Destination()
        modelContext.insert(newDestination)
        path = [newDestination]
        
    }
}

#Preview {
    ContentView()
}
