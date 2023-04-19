//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct TutorialThreeView: View {
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
            Text("Tutorial 3")
                .font(.title.bold())
                .underline(true, color: .orange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 30, trailing: 80))
            
            //Image display
            Image("connectkeythemes")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(getScreenBounds().height < 1700 ? 0.7 : 1)
            
            //Description Text
            VStack(alignment: .center, spacing: 12){
                Text("Find the pattern!\n\nConnect each one of them and see if you discover something from it\n\nTo see yourself in a 'new light'")
                    .font(.system(Font.TextStyle.title, design: .rounded))
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
                    
                    NavigationLink(destination: KeyThemesView(), label:{
                        Text("Can't Wait!")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(width: 215)
                            .background(Color.orange,in:
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

struct TutorialThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialThreeView()
    }
}

