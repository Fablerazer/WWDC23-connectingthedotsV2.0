//
//  ClosingView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct ClosingView: View {
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
            Text("Closing")
                .font(.title.bold())
                .underline(true, color: .orange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 30, trailing: 80))
            
            //Image display
            Image("4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getScreenBounds().width - 100*2, height: getScreenBounds().width - 100*5)
            // small screen adoption...
                .scaleEffect(getScreenBounds().height < 750 ? 0.8 : 1)
                .scaleEffect(getScreenBounds().height > 2000 ? 0.5 : 1)
                .scaleEffect(getScreenBounds().height < 1700 ? 0.7 : 1)
                .offset(y: getScreenBounds().height < 750 ? +10 : +20)
            
            //Description Text
            VStack(alignment: .center, spacing: 12){
                Text("or the fun part, combine them!\nGaming & Music (Both 5 points)\n-> I want to make a game that combine music and a fun gameplay\n-> I want to work in a game company as a Music Composer or Sound Designer\n\nIf you still dont find it, dont worry\ntry again and reflect back ''Did i miss something?''\n\n''You can't connect the dots by looking forward, \nYou can only connect them by looking backwards''\nSteve Jobs\n\n")
                    .font(.system(Font.TextStyle.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 130, trailing: 80))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationBarTitle("Closing")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .padding()
        .frame(width: getScreenBounds().width)
        .frame(maxHeight: .infinity)
        .overlay(
            VStack{
                // Bottom Content...
                HStack(spacing: 25){
                    
                    // NavigationLink...
                    NavigationLink(destination: ClosingTwoView(), label:{
                        
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

struct ClosingView_Previews: PreviewProvider {
    static var previews: some View {
        ClosingView()
    }
}

