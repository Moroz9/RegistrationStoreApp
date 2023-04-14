//
//  VerificationModel.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 08.04.23.
//

import UIKit

final class VerificationModel {
    
    private let mailArray = ["@gmail.com", "@yandex.ru", "@yahoo.com" ]
    public var nameMail = String()
    public var filteredMailArray = [String]()
    
    private func filteringMails(text: String) {
        var domeinMail = String()
        filteredMailArray = []
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domeinMail = String(range)
        mailArray.forEach { mail in
            if mail.contains(domeinMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
        }
    }
    private func deriveNameMail (text: String) {
        guard let atSimvolIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: atSimvolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)
    }
    public func getFilterMail(text: String) {
        filteringMails(text: text)
    }
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
