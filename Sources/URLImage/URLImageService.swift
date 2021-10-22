//
//  File.swift
//  
//
//  Created by Ramon Almeida on 22/10/21.
//

import UIKit
import Combine

internal class URLImageService: ObservableObject {
    @Published internal var image: UIImage = UIImage()
    @Published internal var isLoading: Bool = false
    
    private let url: URL
    private var cancellables = Set<AnyCancellable>()
    
    internal init(_ url: URL) {
        self.url = url
    }
    
    internal func load() {
        isLoading = true
        fetchUiImage(self.url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("[URLImage] Failed with:\nERROR:\(error)\nDESCRIPTION:\(error.localizedDescription)")
                case .finished:
                    print("[URLImage] Done!")
                }
            } receiveValue: { [weak self] newUiImage in
                self?.isLoading = false
                self?.image = newUiImage
            }
            .store(in: &cancellables)
    }
    
    private func fetchUiImage(_ url: URL) -> AnyPublisher<UIImage, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceNil(with: UIImage())
            .mapError { _ in URLImageError.unknown }
            .eraseToAnyPublisher()
    }
}
