//
//  ModalView.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI
//import BottomSheet

struct ModalView: View
{
    //var style: BottomSheetStyle
    var body: some View
    {
        NavigationView
        {
            Text("Hello World!")
            .toolbar
            {
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    NavigationLink(destination: History())
                    {
                        Image(systemName: "clock.arrow.circlepath").imageScale(.large)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    NavigationLink(destination: Settings())
                    {
                        Image(systemName: "gear").imageScale(.large)
                    }
                }
            }
            
        }
        
    }
}
