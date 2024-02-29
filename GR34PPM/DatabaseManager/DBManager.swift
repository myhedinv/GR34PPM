//
//  DBManager.swift
//  GR34PPM
//
//  Created by user252234 on 2/26/24.
//

import Foundation
import SQLite

class DBManager {
    static let sharedInstance = DBManager()
    var db: Connection?
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:  nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("userList").appendingPathExtension("sqlite3")
            
            db = try Connection(fileUrl.path)
        } catch {
            print("Error connecting to DB: \(error)")
        }
    }
    
    func createTable(tableName: String) {
        
    }
    
}
