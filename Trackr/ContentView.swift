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
        TabView(selection: $selection){
            AllTablesView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("All Tables")
                    }
                }
                .tag(0)
            TableStatusView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("Table Status")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
