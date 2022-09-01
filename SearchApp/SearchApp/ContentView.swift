//
//  ContentView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/08/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometryproxy in
            VStack {
                Spacer().frame(width: geometryproxy.size.width, height: geometryproxy.size.height / 4, alignment: .center)
                
                SearchMainView()
                    .padding(.bottom, 20)
                
                Spacer()
                
                Text("@Chenjoo")
                    .font(.system(size: 12))
                    .fontWeight(.heavy)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
