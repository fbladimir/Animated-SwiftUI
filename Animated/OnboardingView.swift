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
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Learn Design & Code")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .frame(width:260, alignment: .leading)
                
                Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.").customFont(.body)  //Custom font is used from custom font modifier made in customfont file
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                
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
                
                Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.").customFont(.footnote)
                    .opacity(0.7)
                
                

            }
            
            .padding(40)
            .padding(.top, 40)
            
            
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
