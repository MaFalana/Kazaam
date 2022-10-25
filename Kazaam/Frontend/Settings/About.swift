//
//  About.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

struct About: View
{
    var body: some View
    {
        List
        {
            HStack
            {
                Text("Version")
                Spacer()
                Text("1.0.0").foregroundColor(.gray)
            }
            
        }.navigationBarTitle("About")
    }
}
