//
//  ViewController.swift
//  CustomSearchBar
//
//  Created by Ozgun Dogus on 25.06.2023.
//

import UIKit

class HomeController: UIViewController {
    

    // Mark : - Variables
    private let images: [UIImage]=[
    UIImage(named: "photo1")!,
    UIImage(named: "photo2")!,
    UIImage(named: "photo3")!,
    UIImage(named: "photo4")!,
    UIImage(named: "photo5")!,
    ]
        
    // Mark : - UI Components
    
    private let searchBar : UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Arama Yapın..."
        searchBar.barTintColor = .white

        if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchBarTextField.textColor = .white
            searchBarTextField.backgroundColor = UIColor.clear
        }
        searchBar.enablesReturnKeyAutomatically = false
        
        searchBar.backgroundImage = UIImage()
      
        return searchBar
    }()
    
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identfier )
        return tableView
    }()
    
   
    // MARK : - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        view.backgroundColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }
    
    //MARK : - Setup UI
    
    private func setupUI () {
        view.backgroundColor = .systemBlue
        self.view.addSubview(tableView)
        self.view.addSubview(searchBar)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        let topGuide = view.safeAreaLayoutGuide.topAnchor
            let bottomGuide = view.safeAreaLayoutGuide.bottomAnchor
            
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: topGuide),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                searchBar.heightAnchor.constraint(equalToConstant: 44),
                
                tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomGuide),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

}

extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identfier, for: indexPath) as? CustomCell else
        {
            fatalError("The TableView could not dequeue a CustomCell in ViewController ")
        }
            
        let image = self.images [indexPath.row]
        
        cell.configure(with: image, and: indexPath.row.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG PRİNT:",indexPath.row)
    }
}

// MARK: - UISearchBar Delegate

extension HomeController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}
