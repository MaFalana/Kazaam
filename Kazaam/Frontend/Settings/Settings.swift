//
//  Settings.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

struct Settings: View
{
    @State var appToggle = false
    @State var systemToggle = false
    @State private var showAlert = false
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isSystem") private var isSystem = false
    //@AppStorage("isSyncing") private var isSyncing = CRUDManager.shared.isSyncing
    
    var body: some View
    {
        List
        {
            Section("About")
            {
                NavigationLink(destination: About() ) //.background(themeManager.selectedTheme.background))
                {
                    Text("About")
                }
                Link("GitHub Repository", destination: URL(string: "https://github.com/MaFalana/Kazaam.git")!)//.foregroundColor(themeManager.selectedTheme.accent)
                Link("Discord Server", destination: URL(string: "https://discord.gg/nZhX8Wrf")!)//.foregroundColor(themeManager.selectedTheme.accent)
            }
            
            Section("General")
            {
                //Toggle("iCloud Sync", isOn: $isSyncing)
                
                HStack
                {
                    Text("Appearance")
                    Spacer()
                    Picker("Appearance", selection: $isDarkMode)
                    {
                        Text("Light").tag(false)
                        Text("Dark").tag(true)
                    }
                    .pickerStyle(.segmented)
                    .fixedSize()
                    .disabled(isSystem)
                }
                //Toggle("Appearance", isOn: $isDarkMode).disabled(isSystem)
                Toggle("Use System Appearance", isOn: $isSystem)
            }
            
            
            Section("Advanced")
            {
                Button("Clear History") {showAlert.toggle()}//.foregroundColor(themeManager.selectedTheme.text)
                    .alert(isPresented: $showAlert)
                {
                    Alert2()
                }
                Button("Reset") { showAlert.toggle() }.alert(isPresented: $showAlert)//.foregroundColor(themeManager.themes.first?.accent)
                {
                    Alert1()
                }
            }
            
        }.listStyle(.insetGrouped)//.background(themeManager.selectedTheme.background)
    }
    
}



