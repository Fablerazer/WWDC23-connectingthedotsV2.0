//
//  File.swift
//
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

import SwiftUI

struct SolutionView: View {
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
            Text("Solution")
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
                .scaleEffect(getScreenBounds().height < 750 ? 0.8 : 1)
                .scaleEffect(getScreenBounds().height > 2000 ? 0.5 : 1)
                .scaleEffect(getScreenBounds().height < 1700 ? 0.7 : 1)
                .offset(y: getScreenBounds().height < 750 ? +10 : +20)
            
            VStack(alignment: .center, spacing: 12){
                Text("''Connecting The Dot'' is here for you!!\n\nWe'll start from your past\nHow can we be who we're today?\nWhat are the causalities?\n\nAnd how we can improve what we've had and boost it for our own benefit\n\nThis framework is also used by\nthe founder of Apple Company 'Steve Jobs'")
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
                HStack(spacing: 25){
                    
                    
                    NavigationLink(destination: TutorialOneView(), label:{
                        Text("Let's get to it!")
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

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView()
    }
}
