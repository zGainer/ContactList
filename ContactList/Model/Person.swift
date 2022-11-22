//
//  Person.swift
//  ContactList
//
//  Created by Eugene on 22.11.22.
//

struct person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension person {
    static func getPersons() -> [person] {
        let names = DataStore.shared.names.shuffled()
        let surnames = DataStore.shared.surnames.shuffled()
        let phoneNumbers = DataStore.shared.phoneNumbers.shuffled()
        let emails = DataStore.shared.emails.shuffled()
        
        var persons: [person] = []
        
        for (index, _) in names.enumerated() {
            persons.append(person(
                name: names[index],
                surname: surnames[index],
                phoneNumber: phoneNumbers[index],
                email: emails[index]
            ))
        }
        
        return persons
    }
}
