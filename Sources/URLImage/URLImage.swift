//
//  SwiftUIView.swift
//  
//
//  Created by Ramon Almeida on 22/10/21.
//

import SwiftUI

public struct URLImage: View {
    @ObservedObject private var service: URLImageService
    
    internal var content: (Image)->Image
    
    public init(_ url: URL, content: @escaping (Image)->Image = {$0}) {
        self.service = URLImageService(url)
        self.content = content
        self.service.load()
    }
    
    public var body: some View {
        if service.isLoading {
            if #available(iOS 14.0, *) {
                ProgressView()
            } else {
                Text("Loading...")
            }
        } else {
            content(Image(uiImage: service.image))
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello, world!")
            URLImage(URL(string: "https://cdn.pixabay.com/photo/2020/12/03/14/35/horror-5800684_960_720.jpg")!)
        }
    }
}
