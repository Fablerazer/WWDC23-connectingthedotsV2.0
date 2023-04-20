//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 20/04/23.
//

import SwiftUI

struct ClosingFirstView: View {
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
            Image("2")
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
                Text("The goal of this tool is for you to find your own journey\nby reconnecting the dots in your past\n\n Using this tool, I gain valuable insights about myself, improve my level of self-discovery, and generate new ideas too!\n\n for the example my highest point is\n\nExploring Tech (1+2+2+2= 7)\n-> I want to make a youtube channel based on my skill of exploring tech\n-> I want work in a QA role (Quality Assurance)\n\n")
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
                    NavigationLink(destination: ClosingView(), label:{
                        
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

struct ClosingFirstView_Previews: PreviewProvider {
    static var previews: some View {
        ClosingFirstView()
    }
}

