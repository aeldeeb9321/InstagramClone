//
//  RegistrationController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/10/22.
//

import UIKit

class RegistrationController: UIViewController{
    
    //MARK: - Properties
    private var viewModel = RegistrationViewModel()
    
    private lazy var addPhotoButton: UIButton = {
        let button = UIButton().makeButton(withImage: UIImage(named: "plus_photo"), isRounded: false)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfileSelect), for: .touchUpInside)
        button.setDimensions(height: 150, width: 150)
        return button
    }()
    
    private lazy var photoPicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        return picker
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
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton().makeButton(withTitle: "Sign Up", titleColor: .white, buttonColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), isRounded: true)
        button.setDimensions(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleUserRegistration), for: .touchUpInside)
        return button
    }()
    
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
        configureNotificationObservers()
    }
    
    //MARK: - Helpers
    
    private func configureUI(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let textFieldStack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, fullNameTextfield, userNameTextfield, signUpButton])
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 20
        textFieldStack.distribution = .fillEqually
        view.addSubview(textFieldStack)
        textFieldStack.anchor(top: addPhotoButton.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingTop: 32, paddingLeading: 32, paddingTrailing: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
        
    }
    
    private func configureNotificationObservers(){
        emailTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    //MARK: - Selectors
    
    @objc private func handleProfileSelect(){
        present(photoPicker, animated: true)
    }
    
    @objc private func handleUserRegistration(){
        print("User has signed up")
    }
    
    @objc private func handleAlreadyHaveAccountTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func textDidChange(sender: UITextField){
        //we added a sender so we can differentiate between different textfields
        switch sender{
        case emailTextfield: viewModel.email = sender.text
        case passwordTextfield: viewModel.password = sender.text
        case fullNameTextfield: viewModel.fullname = sender.text
        case userNameTextfield: viewModel.username = sender.text
        default:
            assertionFailure()
        }
        updateForm()
        
    }
}

//MARK: - FormViewModel
extension RegistrationController: FormViewModel{
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid //if formIsValid we will enable the button, else disable it
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //called once user has finished picking media type
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //info is a dictionary and we are looking for the edited image key's value and casting it as a UIImage
        guard let selectedImage = info[.editedImage] as? UIImage else{ return }
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.borderWidth = 2
        addPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        addPhotoButton.layer.masksToBounds = true
        //dismiss the image picker
        self.dismiss(animated: true)
    }  
}
