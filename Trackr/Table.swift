//
//  Table.swift
//  Trackr
//
//  Created by Nate Reprogle on 7/3/20.
//  Copyright © 2020 Nate Reprogle. All rights reserved.
//

import Foundation
import CoreData

public class Table: NSManagedObject, Identifiable {
    @NSManaged public var number: Int16
    @NSManaged public var clean: Bool
    @NSManaged public var inUse: Bool
}

extension Table {
    static func getAllTables() -> NSFetchRequest<Table> {
        let request: NSFetchRequest<Table> = Table.fetchRequest() as! NSFetchRequest<Table>
        
        let sortDescriptor = NSSortDescriptor(key: "number", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
}
