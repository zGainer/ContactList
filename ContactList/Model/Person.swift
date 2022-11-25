//
//  Person.swift
//  ContactList
//
//  Created by Eugene on 22.11.22.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getPersons() -> [Person] {
        let names = DataStore.shared.names.shuffled()
        let surnames = DataStore.shared.surnames.shuffled()
        let phoneNumbers = DataStore.shared.phoneNumbers.shuffled()
        let emails = DataStore.shared.emails.shuffled()
        
        var persons: [Person] = []
        
        for index in 0..<names.count {
            persons.append(Person(
                name: names[index],
                surname: surnames[index],
                phoneNumber: phoneNumbers[index],
                email: emails[index]
            ))
        }
        
        return persons
    }
}
