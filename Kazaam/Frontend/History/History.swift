//
//  History.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

struct History: View
{
    @StateObject var CM = CoreData_Manager.shared
    //@StateObject var AM = API_Manager.shared
    
    var body: some View
    {
        NavigationView
        {
            List(CM.history)
            {
                i in
                CustomRow(Item: i)
            }
        }
        
    }
}

