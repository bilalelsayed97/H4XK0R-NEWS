//
//  ContentView.swift
//  H4XK0R NEWS
//
//  Created by bilal on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var networkManger = NetworkManger()
    
    var body: some View {
        NavigationView {
            List(networkManger.posts) { post in
                ZStack{
                    HStack(alignment: .firstTextBaseline) {
                        ZStack {
                            
                            Circle()
                                .fill(Color.gray).opacity(0.2)
                                .frame(width: 65, height: 65)
                            VStack {
                                Image(systemName: "flame.fill").foregroundColor(Color.orange)
                                Text("\(post.points)").padding(.horizontal)
                            }
                            
                        }
                        Text(post.title).lineLimit(2).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                    }
                    NavigationLink(destination: DetailView(url: post.url,title: post.title)) {
                        EmptyView().buttonStyle(PlainButtonStyle())
                    }.opacity(0).frame(width: 0,height: 0)
                    
                }.padding(.horizontal)
                .navigationTitle("HACKER NEWS")
            }.onAppear {
                self.networkManger.fetchData()
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
