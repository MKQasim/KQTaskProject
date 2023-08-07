  //
  //  KQContactTableViewCell.swift
  //  KQTaskProject
  //
  //  Created by KamsQue on 21/12/2022.
  //

import UIKit
import Combine

public class KQUsersTableViewCell: UITableViewCell {
  
  static let identifire: String =  "KQUsersTableViewCell"
  private var profileCancellable: AnyCancellable?
  private var profileAnimator: UIViewPropertyAnimator?
  private var countryCancellable: AnyCancellable?
  private var countryAnimator: UIViewPropertyAnimator?
  
  override public func prepareForReuse() {
    super.prepareForReuse()
   
    self.accessibilityTraits = .causesPageTurn
    self.isAccessibilityElement = true
    profileImageView.image = nil
    profileImageView.alpha = 0.0
    profileAnimator?.stopAnimation(true)
    countryAnimator?.stopAnimation(true)
    profileCancellable?.cancel()
    countryCancellable?.cancel()
  }
  
  public func configure(with selectedUser: User?) {
    
    guard let user = selectedUser else {return}
    if let name = user.login {
      nameLabel.text = "Login:\(name)"
    }
    if let jobTitle = user.url {
      jobTitleDetailedLabel.text = "\(jobTitle)"
    }
    
    profileCancellable = ImageLoaderManager.shared.loadImage(for: user.avatarURL).sink { [self] image in ImageLoaderManager.shared.showImage(animator: self.profileAnimator, imageView: profileImageView, image: image) }
    countryCancellable = ImageLoaderManager.shared.loadImage(for: user.avatarURL).sink { [self] image in ImageLoaderManager.shared.showImage(animator: self.countryAnimator, imageView: countryImageView, image: image) }
  }
  
  var selectedUser:User? {
    didSet {
      self.configure(with: selectedUser)
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
  
  lazy var nameLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.numberOfLines = 0
    label.textColor = AppTheme.shared.titleTextColor
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var jobTitleDetailedLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor =  AppTheme.shared.subTitleTextColor
    label.layer.cornerRadius = 5
    label.numberOfLines = 0
    label.clipsToBounds = true
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
    accessibility()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func accessibility(){
    self.isAccessibilityElement = true
    self.accessibilityLabel = "KQContactTableViewCell"
    superContainerView.isAccessibilityElement = true
    superContainerView.accessibilityLabel = "superContainerView"
    profileImageView.isAccessibilityElement = true
    profileImageView.accessibilityLabel = "profileImageView"
    nameLabel.isAccessibilityElement = true
    nameLabel.accessibilityLabel = "nameLabel"
    jobTitleDetailedLabel.isAccessibilityElement = true
    jobTitleDetailedLabel.accessibilityLabel = "jobTitleDetailedLabel"
    containerView.isAccessibilityElement = true
    containerView.accessibilityLabel = "containerView"
    countryImageView.isAccessibilityElement = true
    countryImageView.accessibilityLabel = "countryImageView"
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
      nameLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/2),
      
      // MARK: - jobTitleDetailedLabel Constraints
      jobTitleDetailedLabel.heightAnchor.constraint(equalToConstant: 60),
      jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor,constant: -10),
      jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
      jobTitleDetailedLabel.trailingAnchor.constraint(equalTo:self.countryImageView.leadingAnchor),
      
      // MARK: - countryImageView Constraints
      countryImageView.widthAnchor.constraint(equalToConstant:26),
      countryImageView.heightAnchor.constraint(equalToConstant:26),
      countryImageView.trailingAnchor.constraint(equalTo:self.superContainerView.trailingAnchor, constant:0),
      countryImageView.centerYAnchor.constraint(equalTo:self.superContainerView.centerYAnchor),
    ])
  }
  
}
