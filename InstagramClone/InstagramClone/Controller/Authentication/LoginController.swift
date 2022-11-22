//
//  LoginController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/10/22.
//

import UIKit

class LoginController: UIViewController{
    //MARK: - Properties
    
    //instance of our viewModel
    private var viewModel = LoginViewModel()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(height: 80, width: 120)
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "Instagram_logo_white")
        return iv
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton().makeButton(withTitle: "Log In", titleColor: .white, buttonColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), isRounded: true)
        button.setDimensions(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLoginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "Forgot your password? ", secondPart: "Get help signing in.")
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "Don't have an account?  ", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    //MARK: - Helpers
    private func configureUI(){
        configureGradientLayer()
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let textFieldStack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, loginButton, forgotPasswordButton])
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 20
        textFieldStack.distribution = .fillProportionally
        view.addSubview(textFieldStack)
        textFieldStack.anchor(top: logoImageView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingTop: 32, paddingLeading: 32, paddingTrailing: 32)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.centerX(inView: view)
        forgotPasswordButton.anchor(top: textFieldStack.bottomAnchor, paddingTop: 10)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
    }
    
    private func configureNotificationObservers(){
        emailTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    //MARK: - Selectors
    @objc private func handleSignUpButtonTapped(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func textDidChange(sender: UITextField){
        //we added a sender so we can differentiate between different textfields
        if sender == emailTextfield{
            viewModel.email = sender.text
        }else{
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    @objc private func handleLoginButtonPressed(){
        print("Push Maintab controller, user is authenticated")
    }
}

//MARK: - FormViewModel
extension LoginController: FormViewModel{
    func updateForm() {
        //by using the viewModel we can extract the logic for updating the view from the controller. THe viewModel computed properties handle all of that for us.
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid //if formIsValid we will enable the button, else disable it
    }
    
    
}
