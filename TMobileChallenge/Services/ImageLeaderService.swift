//
//  ImageLeaderService.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/2/21.
//

import UIKit

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
              print("image \(data)")
              completion((UIImage(data: data) ?? UIImage(named: "noImage"))!)
            }
        }
        task.resume()
    }
}
