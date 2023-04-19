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
            Image("1")
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
                Text("The goal of this tools is for you to find your own journey\nby reconnecting the dot in your past\n\nIf you still dont find it, dont worry\ntry again and reflect back ''am i missed something?''\n\nIt takes time but the important part is to always remember on \n''what i'm mostly doing, what i spent time on, what i care about'' so you can use it as your strength point\n\nYou can search ''I,T,Pi, Comb shaped skills'' for more info\n\n''You can't connect the dots by looking forward, you can only connect them by looking backwards''\nSteve Jobs")
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
                        Text("Back button to restart")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(width: 215)
                            .background(Color.red,in:
                                            RoundedRectangle(cornerRadius: 12))
                    
                    
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

