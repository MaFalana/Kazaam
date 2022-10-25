//
//  KazaamApp.swift
//  Kazaam
//
//  Created by Malik Falana on 10/10/22.
//

import SwiftUI

@main
struct Kazaam: App
{
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isSystem") private var isSystem = false
    @StateObject var SM = SnippetManager.shared
    
    func getScheme(Color: String) -> ColorScheme? // Function that returns the color based on the app or system environment
    {
        if Color == "System"
        {
            return .init(.unspecified)
        }
        else
        {
            if isDarkMode == false
            {
                return .light
            }
            else
            {
                return .dark
            }
        }
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            Main()
                .accentColor(SM.color)
                .preferredColorScheme(isSystem ? getScheme(Color: "System") : getScheme(Color: "App") )
        }
    }
}

