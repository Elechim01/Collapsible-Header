//
//  Home.swift
//  Home
//
//  Created by Michele Manniello on 10/08/21.
//

import SwiftUI

struct Home: View {
//    max height...
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge : CGFloat
//    Offset...
    @State var offset : CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:15){
//                Top nav View...
                GeometryReader{ proxy in
                    TopBar(topEge: topEdge,offset: $offset,maxHeight: maxHeight)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
//                    Sticky Effetc...
                        .frame(height: getHeaderheight(),alignment: .bottom)
                        .background(
                            Color("TopBar"),
                            in: CustomCorner(corners: [.bottomRight], radius: getCornerRadius())
                        )
                        .overlay(
//                            top Nav View...
                            HStack(spacing: 15){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                }
                                Image("Pic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .opacity(topBarTitleOpacity())
                                Text("Montagna")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(topBarTitleOpacity())
                                
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.body.bold())
                                }

                            }
                                .padding(.horizontal)
//                            maxHeight...
                                .frame(height: 80)
                                .foregroundColor(.white)
                                .padding(.top,topEdge)
                            ,alignment: .top
                        )
                }
                .frame(height: maxHeight)
//                Fixing at top...
                .offset(y:-offset)
                .zIndex(1)
//                Sample messages...
                VStack(spacing: 15) {
                    ForEach(allMessages){ message in
//                        Card View...
                        MessageCardView(message: message )
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
//        settings coordinate space...
        .coordinateSpace(name: "SCROLL")
    }
    func getHeaderheight()->CGFloat{
        let topHeight = maxHeight + offset
//        80 is the constraint top nav bar height..
//        since we include top safe area so we also need to include taht too..
        
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    func getCornerRadius() -> CGFloat {
        let progess = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progess
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    func topBarTitleOpacity() -> CGFloat {
//        to start after the main content vansihed...
//        we need to eliminate 70 from offset...
//        to get started..
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar: View {
    var topEge : CGFloat
    @Binding var offset : CGFloat
    var maxHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("Pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            Text("Montagna")
                .font(.largeTitle)
            Text("montanga situata in sivzzera nel canton uri")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
//    Calculation Opacity...
    func getOpacity() -> CGFloat {
//     70 = some random amount of time to visible on scroll...
        let progess = -offset / 70
        let opacity = 1 - progess
        return offset < 0 ? opacity : 1
    }
}

struct MessageCardView: View {
    var message : Message
    var body: some View{
        HStack(spacing: 15){
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)
                .opacity(0.8)
            VStack(alignment: .leading, spacing: 8) {
                Text(message.userName)
                    .fontWeight(.bold)
                Text(message.message)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
