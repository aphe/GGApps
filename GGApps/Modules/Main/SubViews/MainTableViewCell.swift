//
//  MainTableViewCell.swift
//  GGApps
//
//  Created by Afriyandi Setiawan on 29/08/20.
//  Copyright © 2020 Afriyandi Setiawan. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
        
    // MARK: - Properties
    
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet var thumbnailImageView: UIImageView!
    
    //MARK: -

    var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    //MARK: -
    var downloader: ImageDownloader!


    // MARK: - Public API
    
    func configure(with title: String, url: URL?) {
        // Configure Title Label
        titleLabel.text = title
        
        // Load Data
        if let url = url {
            downloader = ImageDownloader(cell: self)
            downloader.downloadImage(url: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset Thumnail Image View
        downloader.cancel()
    }


}
