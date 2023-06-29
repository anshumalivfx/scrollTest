//
//  ContentView.swift
//  scrolltest
//
//  Created by Anshumali Karna on 29/06/23.
//

import SwiftUI
import SwiftUIVisualEffects

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            ScrollView{
                VStack(spacing: 60, content: {
                    ForEach(0..<20){ index in
                        CardView()
                            .scrollTransition { content, phase in
                                content.rotation3D(.degrees(phase.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0), perspective: 0.5)
                                    .rotationEffect(.degrees(phase.isIdentity ? 0 : -30))
                                    .offset(x: phase.isIdentity ? 0:-200)
                                    .blur(radius: phase.isIdentity ? 0:10)
                                    .scaleEffect(phase.isIdentity ? 1: 0.8)
                            }
                            .frame(width: UIScreen.main.bounds.width - 30,height: UIScreen.main.bounds.height*25/100)
                            
                    }
                })
                
            }
            
        }
    }
    
    
    
}



struct CardView: View {
    
    var body: some View {
        ZStack {
            Color.clear
                .blurEffect()
                .cornerRadius(10)
                .blurEffectStyle(.systemUltraThinMaterial)
            
            
            
            Image("house")
                
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .vibrancyEffect()
                .vibrancyEffectStyle(.label)
            
            
                
        }
        
        .ignoresSafeArea(.all)
        .overlay(alignment: .top, content: {
            Text("House Designs")
                .font(.system(size: 30, weight: .heavy))
                .padding(.top, 20)
        })
        .overlay(alignment: .bottom) {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .frame(width: 250, height: 120)
                    .blurEffect()
                    .cornerRadius(10)
                    .blurEffectStyle(.systemUltraThinMaterial)
                VStack {
                    
                    HStack(alignment: .top) {
                        Text("Size: 100Sq")
                        Text("Cost: $100k")
                    }
                    
                }
                
                
            })
            .overlay(alignment: .top) {
                Text("Design Specifications")
                    .font(.headline)
                    .padding(.all)
            }
            .padding(.bottom, 7)
            
            
        }
        
        
        
        
    }
}




#Preview {
    ContentView().preferredColorScheme(.dark)
}
