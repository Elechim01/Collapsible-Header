//
//  Message.swift
//  Message
//
//  Created by Michele Manniello on 10/08/21.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor : Color
}
var allMessages: [Message] = [
    Message(message: "Ciao come va?", userName: "Pippo", tintColor: .pink),
    Message(message: "tutto bene", userName: "pluto", tintColor: .red),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ciao come va?", userName: "Pippo", tintColor: .pink),
    Message(message: "tutto bene", userName: "pluto", tintColor: .red),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green),
    Message(message: "Ottimo Dai", userName: "Pippo", tintColor: .green)
]
