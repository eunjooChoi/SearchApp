//
//  SearchMainView.swift
//  SearchApp
//
//  Created by 최은주 on 2022/09/01.
//

import SwiftUI

struct SearchMainView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometryproxy in
                VStack {
                    Spacer().frame(width: geometryproxy.size.width, height: geometryproxy.size.height / 4, alignment: .center)
                    
                    VStack {
                        Text("Search Everything")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        
                    }
                    .padding(.bottom, 20)
                    
                    SearchBoxView()
                    
                    Spacer()
                    
                    Text("@Chenjoo")
                        .font(.system(size: 12))
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView()
    }
}
