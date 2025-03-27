//
//  SwiftUIView.swift
//  practicetv
//
//  Created by Hamza Crichlow on 3/24/25.
//

import SwiftUI

struct Home: View {
    
    @State private var selectedMood: Int = 1
    @State private var gradientColors: [Color] = [Color(hex: "#B5A697"), Color(hex: "#A48449")]
    
    var body: some View {
        NavigationStack{
        ZStack{
            MovingGradientView(colors: gradientColors)
                .ignoresSafeArea(.all)
            HStack{
                
                Spacer()
                Spacer()
                Image("b3")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 30)
                    .padding(.trailing, -50)
                    .padding(.bottom, -100)
                    .shadow(radius: 1)
                    .ignoresSafeArea(.all)
            }
            HStack{
                HStack{
                    
                    Spacer()
                    VStack{
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 1)
                           
                        Spacer()
                        NavigationLink(destination: ContentView()){
                            Image("b1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 600, height: 100)
                                
                                
                        }
                        .buttonStyle(.plain)
                     
                        NavigationLink(destination: {} ){
                            Image("b2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 600, height: 100)
                               
                        }
                        .buttonStyle(.plain)
                        Spacer()
                    }
                    .focusable(true)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .frame(width: 1000, height: 1000)
                .padding()
                Spacer()
            }
            VStack {
                Spacer()
                    .padding()
                TabView{}
            }
            
        }
    }
    }
}

#Preview {
    Home()
}
