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
    
    //set a state
    @State var showModel = false
    
    @Binding var show: Bool
    
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
            
            content
                .offset(y: showModel ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModel ? 0.4 : 0)
                .ignoresSafeArea()
            
            
            if showModel {
                SignInView(showModel: $showModel)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModel = false
                            }
                        
                        } label:  {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow")
                                .opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
                
            }
            
            Button {
                withAnimation {
                    show = false 
                }
            } label:  {
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(20)
                    .offset(y: showModel ? -200: 80)
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Learn With Franklin")
                .font(.custom("Poppins Bold", size: 47, relativeTo: .largeTitle))
                .frame(width:260, alignment: .leading)
            
            Text("An Application Created By Franklin Bladimir Cano. Learning how to program is hard, I understand. Learn with me today and start building applications.").customFont(.body)  //Custom font is used from custom font modifier made in customfont file
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            
            //Adding the declared button to view it
            button.view()
                .frame(width:236, height: 64)
                .overlay{
                    //using an SF symbol to use arrow inside the button
                    Label("Start Learning Today", systemImage: "arrowshape.turn.up.right.circle.fill")
                        .offset(x: 4, y:4)
                        .customFont(.body)
                    
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModel = true
                        }
                    }
                }
            
            Text("Completely Free. Includes access to 30+ courses, 240+ premium tutorials, source files and certificates. Start your journey today!").customFont(.footnote)
                .opacity(0.7)
            
            
            
        }
        
        .padding(40)
        .padding(.top, 40)
        
        
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true))
    }
}
