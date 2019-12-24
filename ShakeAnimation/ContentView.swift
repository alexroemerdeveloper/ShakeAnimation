//
//  ContentView.swift
//  ShakeAnimation
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit   = 3
    var animatableData  : CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
    }
}


struct ContentView: View {
    @State var attempts: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(Color.pink)
                .frame(width: 200, height: 50)
                .cornerRadius(10)
                .modifier(Shake(animatableData: CGFloat(attempts)))
            Button(action: {
                withAnimation(.default) {
                    self.attempts += 1
                }
            }, label: { Text("Login") })
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
