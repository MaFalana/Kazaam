//
//  Main.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

struct Main: View
{
    @StateObject var SM = SnippetManager.shared
    let color1: Color
    let color2: Color
    let color3: Color
    let color4: Color
    let themeArray: [Color]
    @State private var showView = true
    
    init()
    {
        self.color1 = Color(red: 0.76, green: 0.39, blue: 0.89) // #C265E3
        self.color2 = Color(red: 0.69, green: 0.21, blue: 0.88) // #B037E1
        self.color3 = Color(red: 0.62, green: 0, blue: 0.83) // #9D00D4
        self.color4 = Color(red: 0.36, green: 0.02, blue: 0.57) // #5B0492
        self.themeArray = [color1, color4]
    }
    
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                LinearGradient(colors: themeArray, startPoint: .top, endPoint: .bottom)
            
            VStack
            {
                Text("Tap to Kazaam")
                Button { SM.grabSnippet() } label: { Image(systemName: "film").imageScale(.large) }
                //ModalView(style: .standard)
            }
            .sheet(isPresented: $showView) {
                ModalView()
                //.presentationDetents([.medium,.large])
                //.presentationDragIndicator(.visible)
            }
            
            }.edgesIgnoringSafeArea(.all)
        }
    }
}
