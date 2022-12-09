//
//  OnboardingView.swift
//  Animated
//
//  Created by Franklin Bladimir on 12/9/22.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    //declare the riveasset in the beginning
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            //adding background view
            RiveViewModel(fileName: "franky").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                .background(
                    Image("Spline")
                        .blur(radius: 50)
                        .offset(x:200, y:100)
            )
            
            //Adding the declared button to view it 
            button.view()
                .frame(width:236, height: 64)
                .overlay{
                    //using an SF symbol to use arrow inside the button
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y:4)
                        .font(.headline)
                    
                }
            
            //adding a drop shadow to the button
                .background {
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y:10)
                    
                }
            
                //adding the animation to the button
                .onTapGesture {
                    button.play(animationName: "active")
                }
            
            
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
