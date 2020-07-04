//
//  ContentView.swift
//  Trackr
//
//  Created by Nate Reprogle on 7/3/20.
//  Copyright © 2020 Nate Reprogle. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        AllTablesView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
