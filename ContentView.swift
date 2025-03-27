//
//  ContentView.swift
//  practicetv
//
//  Created by Hamza Crichlow on 3/16/25.
//


import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var selectedMood: Int = 1
    @State private var gradientColors: [Color] = [Color(hex: "#B5A697"), Color(hex: "#B09C87")]
    
    var body: some View {
        ZStack{
            MovingGradientView(colors: gradientColors)
                .ignoresSafeArea(.all)
           
            Spacer()
            
          
            VStack{
                HStack {
                    Picker(selection: $selectedMood, label: Text("Mood Picker")) {
                        Image(systemName: "circle.fill")
                            .tag(1)
                        Image(systemName: "circle.fill")
                            .tag(2)
                        Image(systemName: "circle.fill")
                            .tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectedMood) { newValue in
                        switch newValue {
                        case 1:
                            gradientColors = [Color(hex: "#B5A697"), Color(hex: "#B09C87")]
                        case 2:
                            gradientColors = [Color(hex: "#BFBDBA"), Color(hex: "#FFFFFF")]
                        case 3:
                            gradientColors = [Color(hex: "#222121"), Color(hex: "#313131")]
                        default:
                            break
                        }
                    }
                }
                .padding()
            VStack {
                Text("A Collection of Artwork")
                    .font(.title)
                    .padding()
                    .shadow(radius: 37)
                ScrollView(.horizontal /*showsIndicators: false*/) {
                    HStack(spacing: 300) {
                        ForEach(0..<13) { index in
                            Image("A\(index + 1)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 400, height: 500)
                                .shadow(radius: 37)
                                .focusable(true)
                                .scrollTransition(.animated.threshold(.visible(0.5))) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.3)
                                        .scaleEffect(phase.isIdentity ? 1.25 : 0.6575)
                                }
                                .padding()
                        }
                    }
                 
                    
                }
           
            }
        
        }
            HStack{
                Image("I1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Image("I2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Image("I3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Image("I4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .padding(.bottom, -700)
            
        }
    }
}


#Preview {
    ContentView()
}

struct MovingGradientView: View {
    @State private var startPoint = UnitPoint(x: 0.4, y: 0.4)
    @State private var endPoint = UnitPoint(x: 0.6, y: 0.6)
    

    let timer = Timer.publish(every: 8.0, on: .main, in: .common).autoconnect()
    let colors: [Color]
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
            .onReceive(timer) { _ in
               
                withAnimation(.easeInOut(duration: 10)) {
                    
                    startPoint = UnitPoint(x: CGFloat.random(in: 0.35...0.45),
                                           y: CGFloat.random(in: 0.35...0.45))
                    endPoint = UnitPoint(x: CGFloat.random(in: 0.55...0.65),
                                         y: CGFloat.random(in: 0.55...0.65))
                }
            }
    }
}


extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        var int = UInt64()
        Scanner(string: hexSanitized).scanHexInt64(&int)
        
        let r = CGFloat((int & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((int & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(int & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
