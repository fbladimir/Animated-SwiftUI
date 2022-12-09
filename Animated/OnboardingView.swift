//
//  OnboardingView.swift
//  Animated
//
//  Created by Franklin Bladimir on 12/9/22.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    var body: some View {
        RiveViewModel(fileName: "shapes").view()
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
