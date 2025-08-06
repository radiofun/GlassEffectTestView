//
//  SwiftUIView.swift
//  SwiftJul05
//
//  Created by Minsang Choi on 7/11/25.
//

import SwiftUI

struct GlassEffectContainerTest: View {
    
    @Namespace var animation
    
    @State private var dragxpos2 : CGFloat = 0
    @State private var dragypos2 : CGFloat = 0
    @State private var lastpost2 : CGPoint = .zero

    @State private var dragxpos1 : CGFloat = 0
    @State private var dragypos1 : CGFloat = 0
    @State private var lastpost1 : CGPoint = .zero
    
    @State private var spacing : CGFloat = 20

    @State private var isDragging1 : Bool = false
    @State private var isDragging2 : Bool = false
    var body: some View {
        ZStack{
            Image("sample")
                .resizable()
                .scaledToFill()
                .frame(width:400,height:400)
                .cornerRadius(20)
            GlassEffectContainer(spacing: spacing) {
                HStack(spacing: 20.0) {
                    ZStack{
                        Text("regular")
                            .font(.system(size: 12, design: .rounded))
                            .opacity(0.8)

                    }
                        .frame(width: 80.0, height: 80.0)
                        .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 20))
                        .glassEffectUnion(id: isDragging1 || lastpost1.x + dragxpos1 < 0 ? "2" : "1", namespace: animation)
                        .glassEffectTransition(.materialize)
                        .offset(x: lastpost1.x + dragxpos1, y: lastpost1.y + dragypos1)

                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    isDragging1 = true
                                    dragxpos1 = value.translation.width
                                    dragypos1 = value.translation.height

                                }
                                .onEnded { value in
                                    
                                    if lastpost1.x + dragxpos1 > 0 {
                                        withAnimation(.spring()){
                                            isDragging1 = false
                                        }
                                    } else {
                                        isDragging1 = false
                                    }
                                    
                                    
                                    lastpost1.x += dragxpos1
                                    lastpost1.y += dragypos1

                                    dragxpos1 = 0
                                    dragypos1 = 0

                                    
                                }
                            )
                    


                    ZStack{
                        Text("clear")
                            .font(.system(size: 12, design: .rounded))
                            .opacity(0.8)

                    }
                        .frame(width: 80.0, height: 80.0)
                        .glassEffect(.clear, in: .rect(cornerRadius: 20))
                        .offset(x: lastpost2.x + dragxpos2, y: lastpost2.y + dragypos2)
                        .glassEffectUnion(id: "1", namespace: animation)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    isDragging2 = true
                                    dragypos2 = value.translation.height
                                    dragxpos2 = value.translation.width

                                }
                                .onEnded { value in
                                    isDragging2 = false

                                    lastpost2.x += dragxpos2
                                    lastpost2.y += dragypos2

                                    dragxpos2 = 0
                                    dragypos2 = 0

                                }
                        )
                    
                }
            }
            VStack{
                Spacer()
                Text("Spacing : \(spacing, specifier: "%.0f")")
                    .padding()
                    .glassEffect()

                Slider(value:$spacing, in:0...200)
            }
            .foregroundStyle(.black.opacity(0.6))
            .font(.system(size:14))
            .padding()
            

        }
    }
}



#Preview {
    GlassEffectContainerTest()
}
