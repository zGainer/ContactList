//
//  DetailsViewController.swift
//  ContactList
//
//  Created by Eugene on 22.11.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = person.fullName
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
