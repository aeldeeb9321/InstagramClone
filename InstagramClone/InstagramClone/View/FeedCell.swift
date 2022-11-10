//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/9/22.
//

import UIKit

class FeedCell: UICollectionViewCell{
    //MARK: - Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(height: 40, width: 40)
        iv.layer.cornerRadius = 40 / 2
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private let userPostImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.clipsToBounds = true
        return iv
    }()
    
    private let numberOfLikesLabel: UILabel = {
        let label = UILabel().makeLabel(withText: "1 like", textColor: .label, withFont: UIFont.boldSystemFont(ofSize: 13))
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel().makeAttributedLabel(withFirstText: "joker", withSecondText: " Venom is my next target")
        return label
    }()
    
    //buttons
    private lazy var usernameButton: UIButton = {
        let button = UIButton().makeButton(withTitle: "joker", titleColor: .label, buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(handleUsernameTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "like_unselected")?.withRenderingMode(.alwaysOriginal), buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "comment")?.withRenderingMode(.alwaysOriginal), buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "send2")?.withRenderingMode(.alwaysOriginal), buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(handleShareButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "ribbon")?.withRenderingMode(.alwaysOriginal), buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(handleBookmarkButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var editPostButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "like_unselected")?.withRenderingMode(.alwaysOriginal), buttonColor: .white, isRounded: false)
        button.addTarget(self, action: #selector(handleEditButtonTapped), for: .touchUpInside)
        return button
    }()
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureCellComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureCellComponents(){
        addSubview(profileImageView)
        profileImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, paddingTop: 12, paddingLeading: 12)
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView)
        usernameButton.anchor(leading: profileImageView.trailingAnchor, paddingLeading: 6)
        
        addSubview(userPostImageView)
        userPostImageView.anchor(top: profileImageView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: 10)
        
        let buttonStack = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 8
        buttonStack.alignment = .leading
        buttonStack.distribution = .fillProportionally
        addSubview(buttonStack)
        buttonStack.anchor(top: userPostImageView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor,paddingTop: 10, paddingLeading: 6)
        
        
        let postDetailStack = UIStackView(arrangedSubviews: [numberOfLikesLabel, captionLabel])
        postDetailStack.axis = .vertical
        postDetailStack.spacing = 5
        postDetailStack.alignment = .leading
        postDetailStack.distribution = .fillProportionally
        addSubview(postDetailStack)
        postDetailStack.anchor(top: buttonStack.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor,trailing: safeAreaLayoutGuide.trailingAnchor,paddingTop: 5, paddingLeading: 6, paddingBottom: 4)
        
        addSubview(bookmarkButton)
        bookmarkButton.anchor(top: userPostImageView.bottomAnchor, bottom: postDetailStack.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, paddingTop: 10, paddingTrailing: 5)
    }
    
    //MARK: - Selectors
    
    @objc private func handleUsernameTapped(){
        print("Debug did tap username")
    }
    
    @objc private func likeButtonTapped(){
        print("DEBUG: Did tap like button")
    }
    
    @objc private func commentButtonTapped(){
        print("DEBUG: Did tap comment button")
    }
    
    @objc private func handleShareButtonTapped(){
        print("DEBUG: Did tap share button")
    }
    
    @objc private func handleBookmarkButtonTapped(){
        print("DEBUG: Did tap bookmark button")
    }
    
    @objc private func handleEditButtonTapped(){
        print("DEBUG: Did tap edit post button")
    }
}
