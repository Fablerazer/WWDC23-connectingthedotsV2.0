//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct TutorialTwoView: View {
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
            Text("Tutorial 2")
                .font(.title.bold())
                .underline(true, color: .orange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 30, trailing: 80))
            
            //Image display
            Image("prioritizekeythemes")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .scaleEffect(getScreenBounds().height < 1700 ? 0.7 : 1)
            
            //Description Text
            VStack(alignment: .center, spacing: 12){
                Text("If there are some 'less frequent words'\nand it's not something important to you\n\nJust delete them \nso it's easier for you to focus")
                    .font(.system(Font.TextStyle.title, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 25, leading: 80, bottom: 130, trailing: 80))
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
                    
                    NavigationLink(destination: TutorialThreeView(), label:{
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

struct TutorialTwoView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTwoView()
    }
}

