//
//  Alerts.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import SwiftUI

func Alert1() -> Alert
{
    return Alert(title: Text("This action will clear all app data"), message: Text("Do you still want to proceed?") , primaryButton: .destructive(Text("Yes")) { }, secondaryButton: .cancel() )
}

func Alert2() -> Alert
{
    return Alert(title: Text("This action will delete all reading history"), message: Text("Do you still want to proceed?") , primaryButton: .destructive(Text("Yes")) { }, secondaryButton: .cancel() )
}
