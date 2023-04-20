//
//  ConnectKeyThemesView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 19/04/23.
//

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
        VStack {
            ZStack{
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
                HStack {
                    VStack {
                        VStack {
                            // Texts for section 1
                            Text("Before & After Elementary School (SD)")
                                .foregroundColor(.black)
                                .font(.title2)
                            HStack {
                                ForEach(storage.sdTexts, id: \.self) { text in
                                    Text(text)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .padding()
                                        .cornerRadius(10)
                                }
                            }
                            Spacer()
                        }
                        
                        VStack {
                            // Texts for section 2
                            Text("Junior High School (SMP)")
                                .foregroundColor(.black)
                                .font(.title2)
                            HStack {
                                ForEach(storage.smpTexts, id: \.self) { text in
                                    Text(text)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .padding()
                                        .cornerRadius(10)
                                }
                            }
                            Spacer()
                        }
                        
                        VStack {
                            // Texts for section 3
                            Text("Senior High School (SMA)")
                                .foregroundColor(.black)
                                .font(.title2)
                            HStack {
                                ForEach(storage.smaTexts, id: \.self) { text in
                                    Text(text)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .padding()
                                        .cornerRadius(10)
                                }
                            }
                            Spacer()
                        }
                        
                        VStack {
                            // Texts for section 4
                            Text("University Until Now (Kuliah)")
                                .foregroundColor(.black)
                                .font(.title2)
                            HStack {
                                ForEach(storage.kuliahTexts, id: \.self) { text in
                                    Text(text)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .padding()
                                        .cornerRadius(10)
                                }
                            }
                            Spacer()
                        }
                        
                        VStack(){
                            
                            // Action Button...
                            if showNavigation == false {
                                
                                Button("Screenshot & Click Here"){
                                    showNavigation.toggle()
                                    showReading.toggle()
                                }
                                .font(.title2.bold())
                                .padding()
                            }
                            
                            if showNavigation == true {
                                
                                NavigationLink(destination: ClosingFirstView()) {
                                    Text("Next Page")
                                        .font(.title2.bold())
                                        .foregroundColor(.white)
                                        .padding(.vertical, 18)
                                        .frame(width: 200)
                                        .background(Color.black,in:
                                                        RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                        
                        .offset(y:-80)
                    }
                }
            }
            .overlay(
                HStack{
                    Button(action:{ lines = [Line]() }){
                        Text("Reset Drawing")
                            .font(.title2)
                            .foregroundColor(.red)
                            .padding()
                    }
                    Button(action:{ colorSwitcher.toggle() }){
                        Text("Change Color")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                ,alignment: .bottom
            )
            .navigationBarTitle("Connect The Dots!")
            
        }
        
        
    }
}

struct ConnectKeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectKeyThemesView().environmentObject(TextStorage())
    }
}
