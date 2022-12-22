//
//  KQContactTableViewCell.swift
//  KQTaskProject
//
//  Created by KamsQue on 21/12/2022.
//

import UIKit

class KQContactTableViewCell: UITableViewCell {
    
    static let identifire: String =  "KQContactTableViewCell"
    
    var selectedUser:User? {
        didSet {
            guard let user = selectedUser else {return}
            if let name = user.login {
                nameLabel.text = "Login : \(name)"
            }
            if let image = user.avatarURL , let url = URL(string:(image)) {
                profileImageView.load(url: url)
            }
            if let jobTitle = user.type {
                jobTitleDetailedLabel.text = "User Type: \(jobTitle)"
            }
            if let image = user.avatarURL , let url = URL(string:(image)) {
                countryImageView.load(url: url)
            }
        }
    }
    
    private lazy var superContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    private lazy var profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        img.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 2, alpha: 2)
        return img
    }()
    
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .justified
        label.textColor = AppTheme.shared.titleTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var jobTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  AppTheme.shared.subTitleTextColor
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    private lazy var countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Add Views
    
    private func addViews(){
        self.contentView.addSubview(superContainerView)
        self.superContainerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.superContainerView.addSubview(containerView)
        self.superContainerView.addSubview(countryImageView)
    }
    
    // MARK: - Add Views Constraints
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            // MARK: - superContainerView Constraints
            superContainerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor,constant: 0),
            superContainerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:0),
            superContainerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10),
            superContainerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:0),
            superContainerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:0),
            
            // MARK: - profileImageView Constraints
            profileImageView.centerYAnchor.constraint(equalTo:self.superContainerView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo:self.superContainerView.leadingAnchor, constant:10),
            profileImageView.widthAnchor.constraint(equalToConstant:70),
            profileImageView.heightAnchor.constraint(equalToConstant:70),
            
            // MARK: -  containerView Constraints
            containerView.centerYAnchor.constraint(equalTo:self.superContainerView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor , constant:10),
            containerView.trailingAnchor.constraint(equalTo:self.superContainerView.trailingAnchor, constant:0),
            containerView.heightAnchor.constraint(equalTo:superContainerView.heightAnchor),
            // MARK: -  nameLabel Constraints
            nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor),
            
            // MARK: - jobTitleDetailedLabel Constraints
            jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor,constant: 10),
            jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            
            // MARK: - countryImageView Constraints
            countryImageView.widthAnchor.constraint(equalToConstant:26),
            countryImageView.heightAnchor.constraint(equalToConstant:26),
            countryImageView.trailingAnchor.constraint(equalTo:self.superContainerView.trailingAnchor, constant:0),
            countryImageView.centerYAnchor.constraint(equalTo:self.superContainerView.centerYAnchor),
        ])
    }
    
}
