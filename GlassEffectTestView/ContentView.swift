//
//  ContentView.swift
//  GlassEffectTestView
//
//  Created by Minsang Choi on 8/6/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State private var spacing : CGFloat = 40
    @State private var currentpos : CGSize = .zero
    @State private var lastpos : CGSize = .zero
    @State private var isExpanded : Bool = false
    var body: some View {
        
        TabView  {
            
            ZStack{
                Image("sample2")
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width,height:400)
                    .backgroundExtensionEffect()
                
                Text(".identity")
                    .offset(y:120)
                    .foregroundStyle(.white)
                
                GlassEffectContainer(spacing:40){
                    VStack(spacing:spacing){
                        
                        VStack{
                            ZStack{
                                
                            }
                            .frame(width:100,height:100)
                            .glassEffect(.regular)
                            .glassEffectID("parent", in: namespace)
                            .glassEffectTransition(.matchedGeometry)
                            
                            
                            if isExpanded {
                                ZStack{
                                }
                                .frame(width:150, height: 150)
                                .glassEffect(.clear)
                                .glassEffectID("parent", in: namespace)
                                .glassEffectTransition(.matchedGeometry)
                                .offset(x:-5, y:40)
                                
                                
                            }
                        }
                    }
                }

                VStack{
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 1)){
                            isExpanded.toggle()
                        }
                    } label : {
                        Text("Toggle")
                            .padding()
                    }
                    .buttonStyle(.glass)

                }
                .padding()


            }
                ZStack{
                    Image("sample")
                        .resizable()
                        .scaledToFill()
                        .frame(width:UIScreen.main.bounds.width,height:400)
                        .backgroundExtensionEffect()
                    
                    Text(".matchedGeometry")
                        .offset(y:120)
                        .foregroundStyle(.black)

                    GlassEffectContainer(spacing:40){
                        VStack(spacing:spacing){
                            
                            VStack{
                                ZStack{
                                    
                                }
                                .frame(width:200,height:100)
                                .glassEffect(.clear)
                                .glassEffectID("parent", in: namespace)
                                .glassEffectTransition(.matchedGeometry)
                                
                                
                                if isExpanded {
                                    ZStack{
                                    }
                                    .frame(width:100, height: 100)
                                    .glassEffect(.clear)
                                    .glassEffectID("child", in: namespace)
                                    .glassEffectTransition(.matchedGeometry)
                                    .offset(y:40)
                                    
                                    
                                }
                            }
                        }
                    }

                    VStack{
                        Spacer()
                        Button {
                            withAnimation(.easeInOut(duration: 1)){
                                isExpanded.toggle()
                            }
                        } label : {
                            Text("Toggle")
                                .padding()
                        }
                        .buttonStyle(.glass)

                    }
                    .padding()


                }

                
                ZStack{
                    Image("sample3")
                        .resizable()
                        .scaledToFill()
                        .frame(width:UIScreen.main.bounds.width,height:400)
                        .backgroundExtensionEffect()

                    Text(".materialize")
                        .offset(y:120)
                        .foregroundStyle(.white)


                    GlassEffectContainer(spacing:40){
                        VStack(spacing:spacing){
                            
                            VStack{
                                ZStack{
                                    
                                }
                                .frame(width:200,height:100)
                                .glassEffect(.clear)
                                .glassEffectID("parent", in: namespace)
                                .glassEffectTransition(.materialize)
                                
                                
                                if isExpanded {
                                    ZStack{
                                    }
                                    .frame(width:100, height: 100)
                                    .glassEffect(.clear)
                                    .glassEffectID("child", in: namespace)
                                    .glassEffectTransition(.materialize)
                                    .offset(y:40)
                                    
                                    
                                }
                            }
                        }
                    }

                    VStack{
                        Spacer()
                        Button {
                            withAnimation(.easeInOut(duration: 1)){
                                isExpanded.toggle()
                            }
                        } label : {
                            Text("Toggle")
                                .padding()
                        }
                        .buttonStyle(.glass)

                    }
                    .padding()


                }
                


            }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

    }

}

#Preview {
    ContentView()
}
