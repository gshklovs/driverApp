//
//  ContentView.swift
//  OasisDriverApp
//
//  Created by Gregory Shklovski on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignedInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack{
                Spacer()
                ZStack {
                    Color(.white)
                }.frame(height: 540)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
                
            }.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                HStack(spacing: 0) {
                    Text("Ready to start ").foregroundColor(.white)
                    Text("Driving?")
                    
                }.font(.system(size: 30)).padding(.horizontal)
                Spacer()
                TextField("Name", text: $name, prompt: Text("Name").foregroundColor(.blue))
                    .padding(10)
                    .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2)
                }.padding(.horizontal)
                HStack {
                    Group {
                        if showPassword {
                            TextField("Password", text: $password, prompt: Text("Password").foregroundColor(.red))
                        } else {
                            SecureField("Password", text: $password, prompt:
                                Text("Password").foregroundColor(.red))
                        }
                    }
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 2)
                    }
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye").foregroundColor(.red)
                    }
                }.padding(.horizontal)
                Button {
                    print("Do a login aciton")
                } label: {
                    Text("Sign In")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(isSignedInButtonDisabled ? LinearGradient(colors: [.gray],                   startPoint: .topLeading,                   endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(20)
                .disabled(isSignedInButtonDisabled)
                .padding()
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
