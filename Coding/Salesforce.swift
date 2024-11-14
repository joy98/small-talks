//
//  Salesforce.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/07/24.
//


import Foundation

// One Bank Branch - Single ATM
var balance = 1200

let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)

let transactionQueue = DispatchQueue(label: "TransactionQueue", attributes: .concurrent)

struct ATM {
    
    let tag: String
    
    // private let lock = NSLock()
    
    func withdraw(value: Int) {
        // lock.lock()
        // defer {
        //     lock.unlock()
        // }
        transactionQueue.async(flags: .barrier) {
            if balance > value {
                Thread.sleep(forTimeInterval: Double.random(in: 0...2))
                balance -= value
            } else {
                print("\(self.tag): Can't withdraw: insufficent balance")
            }
        }
    }
}


//
//queue.async {
//    let firstATM = ATM(tag: "firstATM")
//    firstATM.withdraw(value: 1000)
//    // this task is stopped line number 12. i.e sleeping of thread.
//}
//
//// Add one more branch
//queue.async {
//    let secondATM = ATM(tag: "secondATM")
//    secondATM.withdraw(value: 800)
//    // withdraw normally and balance will turn to 400 = 1200 - 800
//}
