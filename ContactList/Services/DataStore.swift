//
//  DataStore.swift
//  ContactList
//
//  Created by Eugene on 22.11.22.
//

class DataStore {
    static let shared = DataStore()
    
    let names = ["Kai",
                 "Zion",
                 "Jayden",
                 "Eliana",
                 "Luca",
                 "Ezra",
                 "Maeve",
                 "Aaliyah",
                 "Ava",
                 "Mia",
                 "Harper",
                 "Noah",
                 "Theodore",
                 "Sophia",
                 "Benjamin"]
    
    let surnames = ["Smith",
                    "Johnson",
                    "Williams",
                    "Brown",
                    "Jones",
                    "Garcia",
                    "Miller",
                    "Davis",
                    "Rodriguez",
                    "Martinez",
                    "Hernandez",
                    "Lopez",
                    "Gonzalez",
                    "Wilson",
                    "Anderson"]
    
    let phoneNumbers: [String]
    
    let emails: [String]
    
    init() {
        phoneNumbers = getPhoneNumbers(maxCount: names.count)
        emails = getEmails(maxCount: names.count)
    }
}

private func getPhoneNumbers(maxCount: Int) -> [String] {
    var phoneNumbers: [String] = []
    
    for _ in 0..<maxCount {
        var number = ""
        
        repeat {
            number = getNumber()
        } while phoneNumbers.filter { $0 == number }.count > 0
        
        phoneNumbers.append(number)
    }
    
    return phoneNumbers
}

private func getNumber() -> String {
    var number = ""
    
    for _ in 0...11 {
        number += Int.random(in: 0...9).formatted()
    }
    
    return number
}

private func getEmails(maxCount: Int) -> [String] {
    var emails: [String] = []
    
    for _ in 0..<maxCount {
        var email = ""
        
        repeat {
            email = getEmail()
        } while emails.filter { $0 == email }.count > 0
        
        emails.append(email)
    }
    
    return emails
}

// Force unwrapping потому что точно знаем что не будет nil
private func getEmail() -> String {
    let symbols = "abcdefghijklmnopqrstuvwxyz0123456789"
    
    var prefix = ""
    
    for _ in 0...Int.random(in: 5...10) {
        prefix += String(symbols.randomElement()!)
    }
    
    let email = prefix + getDomain()
    
    return email
}

private func getDomain() -> String {
    ["@gmail.com", "@icloud.com", "@mail.ru"].randomElement()!
}
