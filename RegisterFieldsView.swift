//
//  RegisterFieldsView.swift
//  OasisDriverApp
//
//  Created by Gregory Shklovski on 8/31/23.
//

import SwiftUI

struct RegisterInfo {
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var messages: [String] = []
    
    mutating func validate() -> Bool {
        messages = []
        
        if email.isEmpty {
            messages.append("Please enter an email address to login")
        }
        if password.isEmpty {
            messages.append("Please enter a password to login")
        }
        if !email.contains("@") {
            messages.append("Email must contain @")
        }
        if email.contains(" ") || password.contains(" ") {
            messages.append("No spaces allowed in username or password")
        }
        if confirmPassword != password {
            messages.append("Both passwords must match")
        }
        
        return messages.count == 0
    }
}


struct RegisterFieldsView: View {
    @State private var registerInfo = RegisterInfo()
    @FocusState private var emailFieldFocused: Bool
    @FocusState private var passwordFieldFocused: Bool
    @FocusState private var confrimPasswordFieldFocused: Bool
    
    var body: some View {
        VStack {
            Text("Create your account").font(.system(size: 24)).padding()
            
            Group {
                Text("By signing up you are agreeing to our") + Text(" Terms and privacy policy").foregroundColor(.blue)
            }.multilineTextAlignment(.center).padding(.horizontal, 60)
            
            HStack {
                TextField("Email Address", text: $registerInfo.email, prompt: Text("Email Address")
                    .foregroundColor(.gray)).focused($emailFieldFocused)
                
                Image(systemName: "envelope.fill").foregroundColor(.gray).frame(width: 24)
            }.padding(12)
                .background() {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke( emailFieldFocused ? Color.blue : Color.gray.opacity(0.4), lineWidth: 1)
                }.padding(.horizontal, 32).padding(.vertical, 4).frame(height: 100, alignment: .bottom)
            
            HStack {
                SecureField("Password", text: $registerInfo.password, prompt:
                                Text("Password").foregroundColor(.gray))
                .frame(height: 20)
                .focused($passwordFieldFocused)
                Image(systemName: "lock.fill").foregroundColor(.gray).frame(width: 24)
                
            }.padding(12).background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke( passwordFieldFocused ? Color.blue : Color.gray.opacity(0.4), lineWidth: 1)
            }.padding(.horizontal, 32).padding(.vertical, 4)
            
            HStack {
                SecureField("Confirm Password", text: $registerInfo.confirmPassword, prompt:
                                Text("Confirm Password").foregroundColor(.gray))
                .frame(height: 20)
                .focused($passwordFieldFocused)
                Image(systemName: "checkmark.seal.fill").foregroundColor(.gray).frame(width: 24)
                
            }.padding(12).background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke( passwordFieldFocused ? Color.blue : Color.gray.opacity(0.4), lineWidth: 1)
            }.padding(.horizontal, 32.0).padding(.vertical, 4)
            
            ForEach(registerInfo.messages, id: \.self) {message in
                Text(message).foregroundColor(.red).padding(.horizontal)
            }
            
            Button {
                if registerInfo.validate() {
                    print("register success")
                }
            } label: {
                Text("Sign Up")
                    .bold()
                    .foregroundColor(.white)
                
            }.frame(height: 40)
                .frame(maxWidth: 160)
                .background(.blue)
                .cornerRadius(20)
                .padding(10)
                .frame(height: 100, alignment: .bottom)
        }
    }
}

struct RegisterFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFieldsView()
    }
}
