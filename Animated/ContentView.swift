//
//  ContentView.swift
//  Animated
//
//  Created by Franklin Bladimir on 12/9/22.


import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen = false
    
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    
    var body: some View {
        
        ZStack {
            
            Group {
                
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("SEARCH")
                case .timer:
                    Text("TIMER")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("USER")
                }
            }
            
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104).ignoresSafeArea()
            }
           
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding() 
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
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
