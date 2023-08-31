//
//  ContentView.swift
//  OasisDriverApp
//
//  Created by Gregory Shklovski on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authContext: AuthContext
    
    var body: some View {
        ZStack {
            Group {
                Color.blue.ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Group {
                            Text("Ready to start ").foregroundColor(.white)
                            Text("Driving?")
                        }.font(.system(size: 30))
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            
            VStack{
                Spacer()
                ZStack {
                    Color(.white)
                    NavigationStack {
                        Group {
                            if !authContext.isOnRegisterView {
                                LoginFieldsView()
                            } else {
                                RegisterFieldsView()
                            }
                        }
                    }
                }.frame(height: 560)
                .frame(maxWidth: .infinity)
                .cornerRadius(20).shadow(radius: 6)
            }.ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let authContext = AuthContext()
    
    static var previews: some View {
        ContentView().environmentObject(authContext)
    }
}
