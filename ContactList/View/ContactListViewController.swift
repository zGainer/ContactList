//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Eugene on 22.11.22.
//

import UIKit

class ContactListViewController: UITableViewController {

    let persons = person.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tabBarVC = tabBarController else { return }
        
        for viewController in tabBarVC.viewControllers! {
            if let fullInfoVC = viewController as? FullInfoListViewController {
                fullInfoVC.persons = persons
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName

        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailsVC.person = persons[indexPath.row]
    }
}
