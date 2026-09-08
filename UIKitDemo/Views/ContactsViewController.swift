//
//  ContactsViewController.swift
//  UIKitDemo
//
//  Created by user303027 on 9/8/26.
//

import UIKit

class ContactsViewController: UIViewController {

    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let button = UIButton()
    private let contactContainer = UIStackView()
    
    //whenever the vars change, then update value
    private var name: String = "" {
        didSet {
            self.nameLabel.text = name
        }
    }
    private var email: String = "" {
        didSet{
            self.emailLabel.text = email
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        name = "Steve Smith"
        email = "smith@example.com"
    }

    private func buttonTapped() {
        
        //create the new details screen
        let detailsVC = ContactDetailsViewController()
        
        //navigate to open up the details view
        self.navigationController?.pushViewController(detailsVC, animated: true)    //pushing onto stack
        
    }

}

private extension ContactsViewController {
    
    
    
    func setup() {
        self.view.backgroundColor = .white
        
        //configure the label
        nameLabel.text = name
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        emailLabel.text = email
        
        //configure button
        button.configuration = .filled()
        button.configuration?.title = "View Details"
        button.addAction (UIAction {[weak self] _ in
            self?.buttonTapped()
        }, for: .touchUpInside)
        
        //add the ui views to the container
        contactContainer.addArrangedSubview(nameLabel)
        contactContainer.addArrangedSubview(emailLabel)
        contactContainer.addArrangedSubview(button)
        
        //configure the container element
        contactContainer.backgroundColor = .gray.withAlphaComponent(0.1)
        contactContainer.axis = .vertical
        contactContainer.spacing = 8
        contactContainer.alignment = .leading
        
        //add padding
        contactContainer.isLayoutMarginsRelativeArrangement = true
        contactContainer.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        //rounded corners
        contactContainer.layer.cornerRadius = 8
        contactContainer.clipsToBounds = true
        
        //disable the auto creation of constraints on the top level thing
        contactContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(contactContainer)
        
        NSLayoutConstraint.activate([
            contactContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contactContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contactContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
        ])
        
//        //disable the auto creation of constraints for this label
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        //add label to view so it will be visible
//        self.view.addSubview(label)
//        
//        //add constraints to position and size the label
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20), label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//        ])
        
        
    }
}

