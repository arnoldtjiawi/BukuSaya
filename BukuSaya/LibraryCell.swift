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
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
