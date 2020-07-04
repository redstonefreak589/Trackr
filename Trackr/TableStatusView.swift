//
//  TableStatusView.swift
//  Trackr
//
//  Created by Nate Reprogle on 7/3/20.
//  Copyright © 2020 Nate Reprogle. All rights reserved.
//

import SwiftUI

struct TableStatusView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Table.getAllTables()) var tables: FetchedResults<Table>
    
    @State var table: Table
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Table \(table.number)")
                }.padding(.all, 10.0)
                
                Section {
                    Toggle(isOn: $table.inUse) {
                        Text("In Use")
                    }.padding(.all, 10.0)
                    
                    Toggle (isOn: $table.clean) {
                        Text("Clean")
                    }.padding(.all, 10.0)
                }
            }
        }
    }
}

//struct TableStatusView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableStatusView(table: testTable)
//    }
//}
