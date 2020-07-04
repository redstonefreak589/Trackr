//
//  AllTablesView.swift
//  Trackr
//
//  Created by Nate Reprogle on 7/3/20.
//  Copyright © 2020 Nate Reprogle. All rights reserved.
//

import SwiftUI
import CoreData

struct AllTablesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Table.getAllTables()) var tables: FetchedResults<Table>
    
    @State private var newTable = ""
    
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Hello World!")
            }
            .navigationBarTitle("All Tables")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        print("trash pressed")
                    }) {
                        Image(systemName: "trash")
                            .font(.system(size: 21))
                    }
                    .padding(.trailing, 10.0)
                    
                    Button(action: {
                        print("button pressed")
                    }){
                        Image(systemName: "plus")
                            .font(.system(size: 21))
                    }
              })
        }
    }
}

struct AllTablesView_Previews: PreviewProvider {
    static var previews: some View {
        AllTablesView()
    }
}
