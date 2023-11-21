//
//  CruiseDBManager.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-11-27
//  @description iOS Project - Milestone 4
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import Foundation
import SQLite3

class CruiseDBManager{
    init(){
        db = openDatabase()
        createCruiseTable()
        createUserTable()
    }
    
    let dataPath: String = "CruiseDB"
    var db: OpaquePointer?
    
    // Create DB
    func openDatabase()->OpaquePointer?{
        var filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataPath)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            debugPrint("Cannot open database")
            return nil
        }
        else{
            print("database successfully created.")
            return db
        }
    }
    
    // Create users table
    func createUserTable(){
        
    }
    
    // Insert into user table
    func insertUser(){
        
    }
    
    // Get user from User table
    func getUser(id:Int) -> [User] {
        var user : [User] = []
        return user
    }

    // Update user on User table
    func updateUser(id:Int) {
        
    }
    
    // Delete user on User table
    func deleteUser(id:Int) {
        
    }
    
    // Create cruise table
    func createCruiseTable(){
        var createTableString = "CREATE TABLE IF NOT EXISTS Cruise (id INTEGER PRIMARY KEY, name TEXT, price INTEGER);"
        
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("cruise tabel created successfully")
            }
            else{
                print("cruise table failed")
            }
        }
        else{
            print("failed create statement")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    // Insert into cruise table
    func insertCruise(id:Int, name:String, price:Int){
        let cruises = getCruises()
        for cruise in cruises{
            if cruise.id == id{
                return
            }
        }
        
        let insertStatementString = "INSERT INTO Cruise (id, name, price) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(price))

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("A cruise added successfully!")
            } else {
                print("Couldn't add any row?")
            }
        } else {
            print("INSERT statement failed to succeed!!!")
        }
        sqlite3_finalize(insertStatement)
    }
    
    // Get cruises from Cruise table
    func getCruises() -> [Cruise] {
        let queryStatementString = "SELECT * FROM Cruise;"
        var queryStatement: OpaquePointer? = nil
        var cruises : [Cruise] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let price = sqlite3_column_int(queryStatement, 2)
                cruises.append(Cruise(id: Int(id), name: name, price: Int(price)))
                print("Cruise Details:")
                print("\(id) | \(name) | \(price)")
            }
        } else {
            print("SELECT statement failed to proceed!!!")
        }
        sqlite3_finalize(queryStatement)
        return cruises
    }
    
    // Delete from Cruise table
    func deleteCruiseByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM Cruise WHERE id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("A cruise deleted successfully!")
            } else {
                print("Couldn't delete given cruise")
            }
        } else {
            print("DELETE statement failed to succeed!")
        }
        sqlite3_finalize(deleteStatement)
    }
    
}
