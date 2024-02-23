//
//  DetailView.swift
//  H4XK0R NEWS
//
//  Created by bilal on 23/02/2024.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    let title: String?
    var body: some View {
        if let url, let title {
            WebView(url).navigationBarTitle("\(title)", displayMode: .inline)
        }else{
            Text("There is no url.").navigationBarTitle("Not Found.", displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com",title: "Google")
    }
}

struct WebView: UIViewRepresentable {
    
    let url: String
    let webView: WKWebView
    
    init(_ url: String) {
        webView = WKWebView(frame: .zero)
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: url)!))
    }
}
