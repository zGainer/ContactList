//
//  TabBarController.swift
//  ContactList
//
//  Created by Eugene on 25.11.22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        guard let ContactListVC = viewControllers?.first as? ContactListViewController else { return }
        guard let fullInfoVC = viewControllers?.last as? FullInfoListViewController else { return }
        
        let persons = Person.getPersons()
        
        fullInfoVC.persons = persons
        ContactListVC.persons = persons
    }
}
