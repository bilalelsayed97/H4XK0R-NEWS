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
                HStack {
                    Text(post.title)
                    Spacer()
                    VStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("\(post.points)").padding(.horizontal)
                    }
                }
            }
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
