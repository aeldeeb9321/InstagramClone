//
//  Extensions.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/9/22.
//

import UIKit

extension UIViewController{
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
extension UIView{
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeading: CGFloat = 0, paddingBottom: CGFloat = 0, paddingTrailing: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func centerX(inView view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UITextField{
    func makeTextField(placeholder: String, isSecureField: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.white])
        tf.isSecureTextEntry = isSecureField
        return tf
    }
}

extension UILabel{
    func makeLabel(withText text: String? = nil, textColor: UIColor, withFont font: UIFont) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }
    
    func makeAttributedLabel(withFirstText user: String, withSecondText caption: String) -> UILabel{
        let label = UILabel()
        let attString = NSMutableAttributedString(string: user, attributes: [.font : UIFont.boldSystemFont(ofSize: 14)])
        attString.append(NSAttributedString(string: caption, attributes: [.font : UIFont.systemFont(ofSize: 13)]))
        label.attributedText = attString
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }
    
}

extension UIButton{
    func makeButton(withTitle title: String? = nil, withImage image: UIImage? = nil, titleColor: UIColor? = nil, buttonColor: UIColor? = nil, isRounded: Bool) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setImage(image, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = buttonColor
        
        if isRounded{
            button.layer.cornerRadius = 6
        }
        
        return button
    }
    
    func attributedTitle(firstPart: String, secondPart: String){
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: atts)
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 16)]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}

extension UIColor{
    static func setRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainBlue() -> UIColor{
        return UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
    }
    
    static func purple() -> UIColor{
        return UIColor.setRGB(red: 98, green: 0, blue: 238)
    }
    
    static func pink() -> UIColor{
        return UIColor.setRGB(red: 255, green: 148, blue: 194)
    }
    
    static func teal() -> UIColor{
        return UIColor.setRGB(red: 3, green: 218, blue: 197)
    }
}




