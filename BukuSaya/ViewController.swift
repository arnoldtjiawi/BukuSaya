//
//  ViewController.swift
//  BukuSaya
//
//  Created by Azmi Muhammad on 02/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    //TODO: - mengatur table view
    func setupTableView() {
        //dengan mereferensikan delegate dan data source dari tableView ke ViewController, kita mengkonfirmasi protocol yg kita gunakan (UITableViewDataSource & UITableViewDelegate)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 313
    }

}

//UITableViewDataSource = Protocol yg digunakan untuk mengatur seperti apa tampilan pada setiap barisnya beserta berapa jumlah baris yang ditampilkan

//UITableViewDelegate = Protocol yg digunakan untuk mengatur interaksi yang dapat dilakukan pada setiap barisnya dan mengatur tampilan header/footer

//MARK: - Table View Data Source And Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //TODO: - untuk menentukan jumlah baris yang ditampilkan dalam satu section (group/segment)
    //numberOfRowsInSection = index dari section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //TODO: - untuk mengatur tampilan dalam 1 baris yang ada pada 1 section
    //IndexPath = menyatakan index baik section maupun baris
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as? LibraryCell else {return UITableViewCell()}
        
        cell.bookCategory.text = "Entertainment"
        cell.bookCover.backgroundColor = .red
        cell.bookTitle.text = "Kumpulan Cerita Unik Lampu Merah"
        cell.bookAuthor.text = "Tengku Rep"
        
        return cell
    }
}
