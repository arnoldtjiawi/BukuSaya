//
//  LibraryCell.swift
//  BukuSaya
//
//  Created by Azmi Muhammad on 02/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell {

    @IBOutlet weak var bookCategory: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var authors: [String]?
    var titles: [String]?
    var covers: [UIColor]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}

extension LibraryCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {return UICollectionViewCell()}
        
        guard let covers = covers, let titles = titles, let authors = authors else {return UICollectionViewCell()}
        cell.bookCover.backgroundColor = covers[indexPath.row]
        cell.bookTitle.text = titles[indexPath.row]
        cell.bookAuthor.text = authors[indexPath.row]
        
        return cell
    }
    
    
}
