//
//  DetailViewController.swift
//  GGApps
//
//  Created by Afriyandi Setiawan on 02/09/20.
//  Copyright © 2020 Afriyandi Setiawan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    var imageURL: URL?
    var downloader: DetailImageDownloader!

    override func viewDidLoad() {
        super.viewDidLoad()
        downloader = DetailImageDownloader(vc: self)
        if let imageURL = imageURL{
            downloader.downloadImage(url: imageURL)
        }
    }

}
