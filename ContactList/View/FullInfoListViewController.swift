//
//  FullInfoListViewController.swift
//  ContactList
//
//  Created by Eugene on 23.11.22.
//

import UIKit

class FullInfoListViewController: UITableViewController {

    var persons: [person]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullPersonInfo", for: indexPath)

        let person = persons[indexPath.section]

        var content = cell.defaultContentConfiguration()

        if indexPath.row == 0 {
            content.image = .init(systemName: "phone")
            content.text = person.phoneNumber
        } else if indexPath.row == 1 {
            content.image = .init(systemName: "mail")
            content.text = person.email
        }

        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
}
