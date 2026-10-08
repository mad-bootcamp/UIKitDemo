//
//  ContactsViewController.swift
//  UIKitDemo
//
//  Created by user303027 on 9/8/26.
//

import UIKit

class ContactsViewController: UIViewController {
    
    private var employees: [Employee] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        loadData()

    }

    func loadData() {
        employees = [
            Employee(id: 101, firstName: "Antonio", lastName: "Banderas"),
            Employee(id: 102, firstName: "Olivia", lastName: "Rodrigo"),
            Employee(id: 103, firstName: "Cleo", lastName: "Guerrero"),
            Employee(id: 104, firstName: "Daisy", lastName: "Arteaga"),
            Employee(id: 105, firstName: "Nana", lastName: "Garcia")
        ]
    }

}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of rows we will have
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get a cell from the UITableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //set the cell's contents
        cell.textLabel?.text = employees[indexPath.row].fullName
        
        return cell
        
    }
    
    // MARK: UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectEmployee = employees[indexPath.row]
        let detailsVC = ContactDetailsViewController()
        detailsVC.employee = selectEmployee
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    // MARK: - UI element configuration
    
    func setup() {
        self.view.backgroundColor = .white
        
        
        
        //disable the auto creation of constraints on the top level thing
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
            
        ])
        tableView.dataSource = self
        tableView.delegate = self
        
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

