//
//  LogCategory.swift
//  LoggerKitPlus
//
//  Created by Giovanni Giometti on 30/06/25.
//

import Foundation

public protocol LogCategory {
    var rawValue: String { get }
    var emoji: String { get }
}
