//
//  KQViewController.swift
//  KQTaskProject
//
//  Created by KamsQue on 21/12/2022.
//

import UIKit

class KQViewController: KQSuperVC, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties

    lazy var tableView : UITableView = {     // view
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(KQContactTableViewCell.self, forCellReuseIdentifier: KQContactTableViewCell.identifire)
        view.dataSource = self
        return  view
    }()
    
    private let contacts = ContactAPI.getContacts() // model
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        view.backgroundColor = .red
        configureUI()
    }
    
    // MARK: - SetUp Navigation
    private func setUpNavigation() {
     navigationItem.title = "Contacts"
    }
    
    // MARK: - Private Actions
    private func configureUI() {
        // The .xib files should have the same name as the class file
        setTableViewConstraint()
        tableView.delegate = self
    }
    // MARK: - SetConstraint
    func setTableViewConstraint(){
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension KQViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KQContactTableViewCell.identifire, for: indexPath) as! KQContactTableViewCell
        cell.contact = contacts[indexPath.row]
        print(contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
