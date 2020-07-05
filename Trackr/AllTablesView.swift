//
//  AllTablesView.swift
//  Trackr
//
//  Created by Nate Reprogle on 7/3/20.
//  Copyright © 2020 Nate Reprogle. All rights reserved.
//

import SwiftUI
import CoreData

private var currentTableNumber: Int16 = 0

//MARK: - Main view to house All Tables Tab view
//Includes button actions, list view, and some CoreData code
struct AllTablesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Table.getAllTables()) var tables: FetchedResults<Table>
    
    @State private var tableTapped: Table = Table()
    @State private var isModal = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tables) { table in
                    tableCellView(tableNumber: table.number, clean: table.clean, inUse: table.inUse)
                        .onTapGesture {
                            self.tableTapped = table
                            print("tapped")
                    }
                }
                .onDelete { indexSet in
                    let deletedTable = self.tables[indexSet.first!]
                    self.managedObjectContext.delete(deletedTable)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
                
            }
            .navigationBarTitle("All Tables")
            .navigationBarItems(leading: EditButton(), trailing:
                HStack {
                    DeleteAllTablesButton()
                    
                    AddTableButton()
            })
        }
    }
}

//MARK: - Actions for adding table to CoreData
struct AddTableButton: View {
    
    //Set environment in order to add values
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Table.getAllTables()) var tables: FetchedResults<Table>
    
    @State private var newTable: Int16 = 0
    
    var body: some View {
        //Create a button that will allow us to add tables when we tap it
        Button(action: {
                let table = Table(context: self.managedObjectContext)
                table.number = self.newTable + currentTableNumber
                table.clean = true
                table.inUse = false
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            
            currentTableNumber += 1
                
        })
        {
            Image(systemName: "plus")
                .font(.system(size: 21))
        }
    }
}


//MARK: - Actions for deleting all tables from CoreData
struct DeleteAllTablesButton: View {
    
    //Create private variable for if we're showing the alert or not
    @State private var showingAlert = false
    
    //Set environment in order to delete values
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Table.getAllTables()) var tables: FetchedResults<Table>
    
    var body: some View {
        
        //Create button
        Button(action: {
            //On tap, we set showingAlert to true
            self.showingAlert = true
        }) {
            Image(systemName: "trash")
                .font(.system(size: 21))
        }
        //We show the alert based on the binding showingAlert variable
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Deleting all tables"), message: Text("This button will delete all tables from all devices. Are you sure you want to do so?"), primaryButton: .destructive(Text("Yes")) {
                
                //Delete every object in the fetch request, then attempt to save. Print an error if we don't
                do{
                    for table in self.tables {
                        self.managedObjectContext.delete(table)
                    }
                    
                    try self.managedObjectContext.save()
                    
                } catch {
                    print(error)
                }
            }, secondaryButton: .cancel())
        }
        .padding(.trailing, 10.0)
    }
}

//MARK: - View for each table cell
struct tableCellView: View {
    
    //Initialize variables for cell view
    var tableNumber: Int16
    var clean: Bool
    var inUse: Bool
    
    //Create view
    var body: some View {
        VStack (alignment: .leading){
            Text(String(tableNumber))
                .font(.headline)
            HStack {
                Text(clean ? "Clean: Yes" : "Clean: No")
                    .font(.caption)
                Text(inUse ? "In Use: Yes" : "In Use: No")
                    .font(.caption )
            }
        }
    }
}

struct AllTablesView_Previews: PreviewProvider {
    static var previews: some View {
        AllTablesView()
    }
}
