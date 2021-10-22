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
            ProgressView()
        } else {
            content(Image(uiImage: service.image))
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage()
    }
}
