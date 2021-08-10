//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 10/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        to ignore safe area size...
        GeometryReader{proxy in
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all,edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
