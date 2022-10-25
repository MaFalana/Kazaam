//
//  MainView.swift
//  Kazaam
//
//  Created by Malik Falana on 10/12/22.
//

import SwiftUI

struct MainView: View
{
    var body: some View
    {
        Button
        {
            Snippet_Manager.shared.grabSnippet()
            
        }
        label:
        {
            Image(systemName: "film")
        }.foregroundColor(Snippet_Manager.shared.color)

    }
}

