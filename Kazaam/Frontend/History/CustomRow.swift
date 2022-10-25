//
//  CustomRow.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

struct CustomRow: View
{
    let Item: Media
    
    var body: some View
    {
        HStack
        {
            AsyncImage(url: Item.cover) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 80)
            Spacer()
            VStack
            {
                Text(Item.title).fontWeight(.semibold).lineLimit(1)//.multilineTextAlignment(.leading)
                Text(Item.synopsis).fontWeight(.regular).lineLimit(1)
                Spacer()
                HStack
                {
                    Button{} label: {  } //streaming tags (should be an array)
                    Spacer()
                    Button{print(Item.title)} label: {Image(systemName: "ellipsis") } //ellipsis
                }
            }
        }
    }
}
