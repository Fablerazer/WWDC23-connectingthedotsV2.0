//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct ProblemView: View {
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
            Text("Problems")
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
                Text("Are you one of these people?\n\nA student who's still confused about finding his life path and where his future's heading\nEven though he has studied in that field but still feels like he chose the wrong major.\n\nA high school student who's still confused about their future, which college major would be suitable for their journey.\n\nDon't worry, you're not alone..")
                    .font(.system(Font.TextStyle.title, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 70, trailing: 80))
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
                    
                        NavigationLink(destination: SolutionView(), label:{
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

struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView()
    }
}
