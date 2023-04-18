//
//  IntroductionView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 17/04/23.
//

import SwiftUI

struct IntroductionView: View {
    @State var showNavigation: Bool = false
    @State var showReading: Bool = true
    
    var body: some View {
        VStack(spacing: 15){
            //Title
            Text("Connecting The Dots")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 50, leading: 80, bottom: 0, trailing: 80))
            //Sub-Title
            Text("Introduction")
                .font(.title.bold())
                .underline(true, color: .orange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 30, trailing: 80))
            
            //Image display
            Image("MainCharacter")
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
                Text("Hello, Faizal Here!\n\nI'm from Indonesia\nIf you don't know where it is\n'Bali' is the word for you 😅\n\nI love to build & create something, especially about design, tech, and startup related\n\nI also interested in finance and music")
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
                    if showNavigation == false {
                        Button("Done Swiping?"){
                            showNavigation.toggle()
                            showReading.toggle()
                        }
                        .font(.title2.bold())
                    }
                    // NavigationLink...
                    if showNavigation == true {
                        NavigationLink(destination: KeyThemesView(), label:{
                            Text("Next Page")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .frame(width: 215)
                                .background(Color.black,in:
                                                RoundedRectangle(cornerRadius: 12))
                        })
                    }
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

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}

extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
