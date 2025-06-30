//
//  Logger.swift
//  LoggerKitPlus
//
//  Created by Giovanni Giometti on 30/06/25.
//

import Foundation

public struct Logger {

    public static func log<T: LogCategory>(
        type: T,
        severity: LogSeverity,
        _ message: String,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        let filename = (file as NSString).lastPathComponent
        let timestamp = formattedDate()

        var output = "\n***************************************************************\n"
        output += "\(type.emoji) \(type.rawValue.uppercased())\n"
        output += "*** Date: \(timestamp)\n"
        output += "*** Severity: \(severity.rawValue)\n"
        output += "*** file: \(filename)\n"
        output += "*** function: \(function)\n"
        output += "*** line: \(line)\n"
        output += "*** Message:\n\(message)\n"
        output += "***************************************************************\n"

        print(output)
    }

    private static func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
}

/*
 enum MyLogType: LogCategory {
     case auth, analytics, error

     var rawValue: String {
         switch self {
         case .auth: "AUTH"
         case .analytics: "ANALYTICS"
         case .error: "ERROR"
         }
     }

     var emoji: String {
         switch self {
         case .auth: "🔐"
         case .analytics: "📊"
         case .error: "❌"
         }
     }
 }
 
 Logger.log(
     type: MyLogType.auth,
     severity: .info,
     "Utente loggato correttamente"
 )
 
 ***************************************************************
 🔐 AUTH
 *** Severity: INFO
 *** file: LoginView.swift
 *** function: performLogin()
 *** line: 42
 *** Message:
 Utente loggato correttamente
 ***************************************************************
 */
