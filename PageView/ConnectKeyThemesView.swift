//
//  ConnectKeyThemesView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

//import Foundation
import SwiftUI

struct Line {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
}

struct ConnectKeyThemesView: View {
    @EnvironmentObject var storage: TextStorage
    @State private var lines = [Line]()
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    
    @State var showNavigation: Bool = false
    @State var showReading: Bool = true
    @State private var colorSwitcher : Bool = true
    
    var body: some View {
        ZStack{
            VStack {
                // First layer: canvas
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                    let newPoint = value.location
                    
                    if colorSwitcher == true {
                        if value.translation.width + value.translation.height == 0 {
                            lines.append(Line(points: [newPoint], color: Color(.orange), lineWidth: 5))
                        }else{
                            let index = lines.count - 1
                            lines[index].points.append(newPoint)
                        }
                    }else{
                        if value.translation.width + value.translation.height == 0 {
                            lines.append(Line(points: [newPoint], color: Color(.blue), lineWidth: 5))
                        }else{
                            let index = lines.count - 1
                            lines[index].points.append(newPoint)
                        }
                    }
                }))
                
                ZStack {
                        ForEach(storage.sdTexts + storage.smpTexts + storage.smaTexts + storage.kuliahTexts, id: \.self) { text in
                            Text(text)
                                .foregroundColor(.black)
                                .font(.title2)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .opacity(showReading ? 1 : 0) // Show or hide the text layer based on showReading variable


                
                VStack(){
                    
                    // Action Button...
                    if showNavigation == false {
                        
                        Button("Done Connecting?"){
                            showNavigation.toggle()
                            showReading.toggle()
                        }
                        .font(.title2.bold())
                        .padding()
                    }
                    
                    if showNavigation == true {
                        
                        // show text that you have to screenshot this so it would be saved to your device
                        NavigationLink(destination: ManyShapedSkillView()) {
                            Text("Next Page")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .frame(width: 200)
                                .background(Color.black,in:
                                                RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .offset(y:-100)
                .navigationBarTitle("Connect The Dots!")
            }
        }
        .overlay(
            HStack{
                Button(action:{ lines = [Line]() }){
                    Text("Reset Drawing")
                        .font(.title2)
                        .foregroundColor(.red)
                    
                    Button("Change Color"){
                        colorSwitcher.toggle()
                    }
                    .font(.title2.bold())
                    .foregroundColor(.blue)
                    
                    .padding()
                    
                    
                }
            }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
            ,alignment: .bottom
        )
    }
}

struct ConnectKeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectKeyThemesView().environmentObject(TextStorage())
    }
}
