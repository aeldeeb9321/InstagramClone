//
//  RegistrationController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/10/22.
//

import UIKit

class RegistrationController: UIViewController{
    //MARK: - Properties
    private let addPhotoButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "plus_photo"), isRounded: false)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextfield: UITextField = {
        let tf = UITextField().makeTextField(placeholder: " Email", isSecureField: false)
        tf.setDimensions(height: 50)
        return tf
    }()
    
    private let passwordTextfield: UITextField = {
        let tf = UITextField().makeTextField(placeholder: " Password", isSecureField: true)
        tf.setDimensions(height: 50)
        return tf
    }()
    
    private let fullNameTextfield = UITextField().makeTextField(placeholder: " Fullname", isSecureField: false)
    private let userNameTextfield = UITextField().makeTextField(placeholder: " Username", isSecureField: false)
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "Already have an account? ", secondPart: "Log In")
        button.addTarget(self, action: #selector(handleAlreadyHaveAccountTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configureUI()
    }
    
    //MARK: - Helpers
    
    private func configureUI(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let textFieldStack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, fullNameTextfield, userNameTextfield])
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 20
        textFieldStack.distribution = .fillEqually
        view.addSubview(textFieldStack)
        textFieldStack.anchor(top: addPhotoButton.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingTop: 32, paddingLeading: 32, paddingTrailing: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
        
    }
    
    //MARK: - Selectors
    
    @objc private func handleAlreadyHaveAccountTapped(){
        navigationController?.popViewController(animated: true)
    }
}
