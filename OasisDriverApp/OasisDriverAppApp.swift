//
//  OasisDriverAppApp.swift
//  OasisDriverApp
//
//  Created by Gregory Shklovski on 8/27/23.
//

import SwiftUI

final class AuthContext: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var isOnRegisterView: Bool = false
}

@main
struct OasisDriverAppApp: App {
    @StateObject var authContext = AuthContext()
    
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(authContext)
        }
    }
}
