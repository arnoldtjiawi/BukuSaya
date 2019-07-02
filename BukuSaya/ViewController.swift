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
    
    var categories = ["Kids", "Entertainment", "Religion", "History"]
    var authors = ["Erlangga", "Tengku Rep", "H. Rajawali", "Plato"]
    var titles = ["Kisah Si Unyil", "Kumpulan Cerita Unik Lampu Merah", "Menuju Restu Orang Tua Dengan Doa", "Bumi dan Api"]
    var covers = [UIColor.darkGray, UIColor.red, UIColor.blue, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    //MARK: - Mengatur table view
    func setupTableView() {
        //dengan mereferensikan delegate dan data source dari tableView ke ViewController, kita mengkonfirmasi protocol yg kita gunakan (UITableViewDataSource & UITableViewDelegate)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 313
    }

    //MARK: - Menambah daftar buku
    @IBAction func addBook(_ sender: UIBarButtonItem) {
        //membuat alert controller
        let alert = UIAlertController(title: "Judul Buku", message: "Masukan judul buku", preferredStyle: .alert)
        
        //membuat data sementara untuk author, category, and cover
        let author = authors[Int.random(in: 0..<4)]
        let category = categories[Int.random(in: 0..<4)]
        let cover = covers[Int.random(in: 0..<4)]
        
        //mengatur text field di dalam alert
        var textField = UITextField()
        alert.addTextField { (field) in
            field.placeholder = "Nama buku"
            textField = field
        }
        
        //TODO: - Adding title based on user input with dummy data
        //mengatur tombol pada alert
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.titles.append(textField.text ?? "")
            self.authors.append(author)
            self.categories.append(category)
            self.covers.append(cover)
            
            //fungsi reloadData adalah untuk mengupdate perubahan yg ada pada table view
            self.tableView.reloadData() //coba comment dan jalankan aplikasi. apa bedanya?
        }))
        
        //present alert controller
        self.present(alert, animated: true, completion: nil)
    }
}

//UITableViewDataSource = Protocol yg digunakan untuk mengatur seperti apa tampilan pada setiap barisnya beserta berapa jumlah baris yang ditampilkan

//UITableViewDelegate = Protocol yg digunakan untuk mengatur interaksi yang dapat dilakukan pada setiap barisnya dan mengatur tampilan header/footer

//MARK: - Table View Data Source And Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //TODO: - untuk menentukan jumlah baris yang ditampilkan dalam satu section (group/segment)
    //numberOfRowsInSection = index dari section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    //TODO: - untuk mengatur tampilan dalam 1 baris yang ada pada 1 section
    //IndexPath = menyatakan index baik section maupun baris
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as? LibraryCell else {return UITableViewCell()}
        
        cell.bookCategory.text = categories[indexPath.row]
        cell.bookCover.backgroundColor = covers[indexPath.row]
        cell.bookTitle.text = titles[indexPath.row]
        cell.bookAuthor.text = authors[indexPath.row]
        
        return cell
    }
}
