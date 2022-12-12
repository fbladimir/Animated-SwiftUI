//
//  ContentView.swift
//  Animated
//
//  Created by Franklin Bladimir on 12/9/22.


import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    var body: some View {
        
        ZStack {
            
            switch selectedTab {
            case .chat:
                Text("CHAT")
            case .search:
                Text("SEARCH")
            case .timer:
                Text("TIMER")
            case .bell:
                Text("Bell")
            case .user:
                Text("USER")
            }
            
            TabBar()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
