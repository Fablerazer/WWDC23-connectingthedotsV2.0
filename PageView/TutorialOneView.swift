//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct TutorialOneView: View {
    @State var showNavigation: Bool = false
    @State var showReading: Bool = true
    
    var body: some View {
        VStack(spacing: 15){
            //Title
            Text("Connecting The Dots")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 80))
            //Sub-Title
            Text("Tutorial 1")
                .font(.title.bold())
                .underline(true, color: .orange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 30, trailing: 80))
            
            //Image display
            Image("keyjourneythemes")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            //Description Text
            VStack(alignment: .center, spacing: 12){
                Text("Reflect back to your past\nThe purpose is for self-discovery\n\nA tip from me:\n1. Categorize & Prioritize Scoring Points (P)\n[T] Things that you've done frequently or spent your time on (1P)\n[L] Things that you ''enjoyed doing'' back then (1P)\n[T&L] If both, (2P)\n\n2. Avoid putting things that almost belong to one category:\nPiano, vocal group -> Music\nTennis, swimming, gym -> Fitness")
                    .font(.system(Font.TextStyle.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 130, trailing: 80))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .frame(width: getScreenBounds().width)
        .frame(maxHeight: .infinity)
        .overlay(
            VStack{
                // Bottom Content...
                HStack(spacing: 25){
                    
                    // NavigationLink...
                    
                    NavigationLink(destination: TutorialTwoView(), label:{
                        Text("Next Page")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(width: 215)
                            .background(Color.black,in:
                                            RoundedRectangle(cornerRadius: 12))
                    })
                    
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                HStack{
                }
                .padding(.top,20)
                .padding(.horizontal,28)
            }
                .padding(.top,20)
                .padding(.bottom,5)
            ,alignment: .bottom
        )
    }
}

struct TutorialOneView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialOneView()
    }
}

