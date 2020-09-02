//
//  MainViewController.swift
//  GGApps
//
//  Created by Afriyandi Setiawan on 29/08/20.
//  Copyright © 2020 Afriyandi Setiawan. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    // MARK: - Types
    private struct Image {
        // MARK: - Properties
        let title: String
        // MARK: -
        let url: URL?
    }
    
    // MARK: - Properties

    private lazy var dataSource: [Image] = [
        Image(title: "Jembatan Situ Gunung",                    url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688237/situ-gunung_llx7rv.jpg")),
        Image(title: "Gunung Sumbing",              url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688203/sumbing_cpkg5o.jpg")),
        Image(title: "Gunung Gede",                 url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688198/gede_kdyiwn.jpg")),
        Image(title: "Pantai Nusa Penida",             url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688197/penida_n6gsdd.jpg")),
        Image(title: "Gunung Prau",                      url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688196/prau_npnvar.jpg")),
        Image(title: "Gunung Kelud",   url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688163/Kelud_woaonx.jpg")),
        Image(title: "Bukit Mongkrang",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688162/Mongkrang_mfovp8.jpg")),
        Image(title: "Pantai Lombok",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688153/lombok_r2kols.jpg")),
        Image(title: "Pantai Munggu",         url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688149/Munggu_iycyka.jpg")),
        Image(title: "Jembatan Emas Pangkalpinang",                    url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688135/jembatan_emas_iaqz6a.jpg")),
        Image(title: "Jembatan Suramadu",              url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598688129/Suramadu_ecionw.jpg")),
        Image(title: "Gunung Rinjani",                 url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692269/rinjani_okekte.jpg")),
        Image(title: "Gunung Merapi",             url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692261/merapi_wvn2qp.jpg")),
        Image(title: "Gunung Bromo",                      url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692251/bromo_evia3v.jpg")),
        Image(title: "Pantai Wedi Lumbo",   url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692106/wedi-lumbo_qss5j6.jpg")),
        Image(title: "Pantai Bintan",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692094/bintan_y41ubk.jpg")),
        Image(title: "Gunung Gamping",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692087/gamping_kf5ty9.jpg")),
        Image(title: "Gunung Batur",         url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692079/batur_ehsbk3.jpg")),
        Image(title: "Gunung Sindoro",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692065/sindoro_ylxmol.jpg")),
        Image(title: "Gunung Agung",                url: URL(string: "https://res.cloudinary.com/crayonmind/image/upload/v1598692023/agung_h866u5.jpg")),

    ]
    
    private var selectedRow: Int?
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailViewController {
            if let sRow = selectedRow {
                dest.imageURL = dataSource[sRow].url
            }
        }
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else {
            fatalError("Unable to Dequeue Image Table View Cell")
        }
        
        // Fetch Image
        let image = dataSource[indexPath.row]

        // Configure Cell
        cell.configure(with: image.title, url: image.url)

        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}

