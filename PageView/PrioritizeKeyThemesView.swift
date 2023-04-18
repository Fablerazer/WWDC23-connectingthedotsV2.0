//
//  PrioritizeKeyThemesView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 18/04/23.
//

import SwiftUI

struct PrioritizeKeyThemesView: View {
    @EnvironmentObject var storage: TextStorage

    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct PrioritizeKeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        PrioritizeKeyThemesView().environmentObject(TextStorage())
    }
}
