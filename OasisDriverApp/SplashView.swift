//
//  SplashView.swift
//  OasisDriverApp
//
//  Created by Gregory Shklovski on 8/28/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 1.6
    @State private var opacity = 0.5
    
    @EnvironmentObject var authContext: AuthContext
    
    var body: some View {
        if isActive{
            ContentView()
        } else {
            ZStack{
                Color.blue.ignoresSafeArea()
                HStack(spacing: 0){
                    Text("O").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.yellow).padding(0)
                    Text("ASIS").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white).padding(0)
                }.scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1.8
                            self.opacity = 1.0
                        }}
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            
        }
        }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
