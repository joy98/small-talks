//
//  929.swift
//  Small Talks
//
//  Created by Joy Sarkar on 01/09/24.
//

import Foundation

class Solution929 {
    func numUniqueEmails(_ emails: [String]) -> Int {
       var s: Set<String> = Set<String>()

       for email in emails {
        let charArr = Array(email)
        var newMail : Array<Character> = []
        var ignore = false
        var isLocal = true

        for ch in charArr {
            if ch == "@" {
                ignore = false
                isLocal = false
            } else if ch == "." && isLocal {
                continue
            } else if ch == "+" && isLocal {
                ignore = true
            }

            if !ignore {
                newMail.append(ch)
            }
        }
        print(String(newMail))
        s.insert(String(newMail))
       }


       return s.count
    }
    
    func numUniqueEmailsHard(_ emails: [String]) -> Int {
        Set(emails.map({ email in
            email.components(separatedBy: "@").enumerated().map({
                $0 == 0 ? $1.replacingOccurrences(of: ".", with: "").components(separatedBy: "+").first! : $1
            }).joined(separator: "@")
        })).count
    }
}
