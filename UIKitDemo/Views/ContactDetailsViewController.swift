//
//  ContactDetailsViewController.swift
//  UIKitDemo
//
//  Created by user303027 on 9/8/26.
//


import UIKit

class ContactDetailsViewController: UIViewController {

    var employee: Employee? {
        didSet {
            updateUI()
        }
    }
    
    private let colors = [UIColor.systemBlue, UIColor.systemRed, UIColor.systemOrange, UIColor.systemPink, UIColor.systemTeal]
    
    private let firstLabel = UILabel()
    private let lastLabel = UILabel()
    private let button = UIButton()
    private let contactContainer = UIStackView()
    private let animatingView = UIImageView()
        
    
    private func updateUI() {
        firstLabel.text = employee?.firstName
        lastLabel.text = employee?.lastName
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 1.3, delay: 0, options: [.repeat, .autoreverse], animations: {
            [weak self] in self?.animatingView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }

    private func buttonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }

}

private extension ContactDetailsViewController {
    

    
    
    func setup() {
        self.view.backgroundColor = .white
        
        //configure the label
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        theLabel.text = "These are the contact details"
//        theLabel.font = .systemFont(ofSize: 24, weight: .bold)
        firstLabel.addGestureRecognizer(tapRecognizer)
        firstLabel.isUserInteractionEnabled = true
        lastLabel.addGestureRecognizer(tapRecognizer)
        lastLabel.isUserInteractionEnabled = true
        
        
        //configure button
        button.configuration = .filled()
        button.configuration?.title = "Close"
        button.addAction (UIAction {[weak self] _ in
            self?.buttonTapped()
        }, for: .touchUpInside)
        
        
        animatingView.image = UIImage(systemName: "volleyball.fill")
        animatingView.tintColor = .systemBlue
        animatingView.contentMode = .scaleAspectFit
        animatingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        //add the ui views to the container
        contactContainer.addArrangedSubview(firstLabel)
        contactContainer.addArrangedSubview(lastLabel)
        contactContainer.addArrangedSubview(button)
        contactContainer.addArrangedSubview(animatingView)
        
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
        animatingView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(contactContainer)
        
        NSLayoutConstraint.activate([
            contactContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contactContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contactContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            animatingView.centerXAnchor.constraint(equalTo: contactContainer.centerXAnchor)
            
        ])
        
        self.view.isAccessibilityElement = true
        self.view.accessibilityLabel = "Contact Information"
        
        button.accessibilityHint = "Tap to dismiss this view"
        lastLabel.accessibilityTraits = [.button]
        
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
        
        //this function needs to be visible to the library where the recognizers are defined
        //that libray is written in objective c
        //(swift code is not visible to objective c by default
        
        
    }
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer) {
        let color = colors.randomElement()
        contactContainer.backgroundColor = color?.withAlphaComponent(0.1)
    }
}
