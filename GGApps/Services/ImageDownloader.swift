//
//  ImageDownloader.swift
//  GGApps
//
//  Created by Afriyandi Setiawan on 02/09/20.
//  Copyright © 2020 Afriyandi Setiawan. All rights reserved.
//

import UIKit

class ImageDownloader {
        
    init(cell: MainTableViewCell) {
        self.cell = cell
    }
    
    var cell: MainTableViewCell
    private var dataTask: URLSessionDataTask?
    
    func downloadImage(url: URL) {
        let dataTask = cell.session.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.cell.thumbnailImageView?.image = UIImage(data: data)
            }
        }
        dataTask.resume()
        self.dataTask = dataTask
    }
    
    func cancel() {
        self.cell.thumbnailImageView?.image = nil
        dataTask?.cancel()
        dataTask = nil
    }
    
}

class DetailImageDownloader {
    
    init(vc: DetailViewController) {
        self.vc = vc
    }
    
    var vc: DetailViewController
    
    private var dataTask: URLSessionDataTask?

    func downloadImage(url: URL) {
        let dataTask = vc.session.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.vc.image?.image = UIImage(data: data)
            }
        }
        dataTask.resume()
        self.dataTask = dataTask
    }
    
    func cancel() {
        self.vc.image?.image = nil
        dataTask?.cancel()
        dataTask = nil
    }
}
