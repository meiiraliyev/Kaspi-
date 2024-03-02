//
//  CustomSearchBar .swift
//  stocksApp0412
//
//  Created by Meiir on 16.01.2024.
//

import Foundation
import UIKit

final class CustomSearchBar: UIView{
    weak var viewControllerDelegate: UITextFieldDelegate?{
        didSet{
            textField.delegate = viewControllerDelegate!
        }
    }
    
    init(){
        super.init(frame: .zero)
        
        super.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Search"))
        return iv
    }()
    
    let  textField: UITextField = {
        let tf =  UITextField()
        tf.text = "Имя, сумма, сообщение"
        tf.font = UIFont.systemFont(ofSize: 18.0)
        return tf
    }()

    func setupUI(){
        self.backgroundColor = .white
        self.addSubview(searchImage)
        self.addSubview(textField)
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 48),
            self.widthAnchor.constraint(equalToConstant: 374),

            
            searchImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 8),
        ])
        
    }
}

