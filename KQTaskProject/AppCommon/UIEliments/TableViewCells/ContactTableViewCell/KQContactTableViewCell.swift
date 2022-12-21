//
//  KQContactTableViewCell.swift
//  KQTaskProject
//
//  Created by KamsQue on 21/12/2022.
//

import UIKit

class KQContactTableViewCell: UITableViewCell {
    static let identifire: String =  "KQContactTableViewCell"
    var contact:Contact? {
            didSet {
                guard let contactItem = contact else {return}
                if let name = contactItem.name {
                    profileImageView.image = UIImage(named: "qasim")
                    nameLabel.text = name
                }
                if let jobTitle = contactItem.jobTitle {
                   jobTitleDetailedLabel.text = " \(jobTitle) "
                }
               
                if let country = contactItem.country {
                    countryImageView.image = UIImage(named: "flag")
                }
            }
        }
    
    lazy var profileImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 35
             img.clipsToBounds = true
            img.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 2, alpha: 2)
            return img
         }()
    
    lazy var nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = UIColor(red:  0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    lazy var jobTitleDetailedLabel:UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      label.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
      label.backgroundColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    
    lazy var countryImageView:UIImageView = {
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
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
    }
    
    // MARK: - Add Views Constraints
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            // MARK: - profileImageView Constraints
            profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            profileImageView.widthAnchor.constraint(equalToConstant:70),
            profileImageView.heightAnchor.constraint(equalToConstant:70),
            
            // MARK: -  containerView Constraints
            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10),
            containerView.heightAnchor.constraint(equalToConstant:40),
            // MARK: -  nameLabel Constraints
            nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor),
            
            // MARK: - jobTitleDetailedLabel Constraints
            jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor),
            jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor),
            // MARK: - countryImageView Constraints
            countryImageView.widthAnchor.constraint(equalToConstant:26),
            countryImageView.heightAnchor.constraint(equalToConstant:26),
            countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20),
            countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
        ])
    }

}
