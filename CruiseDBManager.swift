//
//  CruiseDBManager.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-12-01
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
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataPath)
        
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
    func createUserTable() {
        let createTableString = """
            CREATE TABLE IF NOT EXISTS User (
                id INTEGER PRIMARY KEY,
                first_name TEXT,
                last_name TEXT,
                email TEXT,
                password TEXT,
                address TEXT,
                city TEXT,
                country TEXT
            );
        """

        var createTableStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("User table created successfully")
            } else {
                print("User table creation failed")
            }
        } else {
            print("Failed to create User table")
        }

        sqlite3_finalize(createTableStatement)
    }

    
    // Insert into user table
    func insertUser(id: Int, first_name: String, last_name: String, email: String, password: String) -> Bool{
        let users = getAllUsers()
        
        for user in users{
            if user.id == id || user.email == email{
                return false
            }
        }
        
        let insertStatementString = "INSERT INTO User (id, first_name, last_name, email, password, address, city, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (first_name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (last_name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, "", -1, nil)
            sqlite3_bind_text(insertStatement, 7, "", -1, nil)
            sqlite3_bind_text(insertStatement, 8, "", -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print(" User created successfully!")
                sqlite3_finalize(insertStatement)
                return true
            } else {
                print("Couldn't add any row?")
                return false
            }
        } else {
            print("INSERT statement failed to succeed!!!")
            return false
        }
    }
    
    // Login user
    func loginUser(email: String, password: String) -> Bool {
        let queryStatementString = "SELECT * FROM User WHERE email = ? AND password = ?;"
        var queryStatement: OpaquePointer? = nil
        var loginSuccessful = false

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (password as NSString).utf8String, -1, nil)

            if sqlite3_step(queryStatement) == SQLITE_ROW {
                // User found with matching email and password
                loginSuccessful = true
                print("Login successful for user with email: \(email)")
            } else {
                // No user found with matching email and password
                print("Login failed. Invalid email or password.")
            }
        } else {
            print("SELECT statement failed to proceed!!!")
        }

        sqlite3_finalize(queryStatement)
        return loginSuccessful
    }

    // Get all the users from User table
    func getAllUsers() -> [User] {
        let queryStatementString = "SELECT * FROM User;"
        var queryStatement: OpaquePointer? = nil
        var users : [User] = []
        if sqlite3_prepare_v2(db,  queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let first_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let last_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let email = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let city = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let country = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                
                users.append(User(id: Int(id), first_name: first_name, last_name: last_name, email: email, password: password, address: "", city: city, country: country))
                print("User Details:")
                print("\(id) | \(first_name) | \(last_name) | \(email) | \(password) | \(address) \(city) | \(country)")
            }
        } else {
            print("SELECT statement failed to proceed!!!")
        }
        sqlite3_finalize(queryStatement)
        return users
    }
    
    // Get user from User table
    func getUser(email:String) -> [User] {
        let queryStatementString = "SELECT * FROM User WHERE email = ?;"
        var queryStatement: OpaquePointer? = nil
        var user : [User] = []
        
        if sqlite3_prepare_v2(db,  queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let first_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let last_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let email = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let city = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let country = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                
                user.append(User(id: Int(id), first_name: first_name, last_name: last_name, email: email, password: password, address: address, city: city, country: country))
                print("User Details:")
                print("\(id) | \(first_name) | \(last_name) | \(email) | \(password) | \(address) \(city) | \(country)")
            }
        } else {
            print("SELECT statement failed to proceed!!!")
        }
        sqlite3_finalize(queryStatement)
        return user
    }

    // Update user on User table
    func updateUser(first_name: String, last_name: String, address: String, city: String, country: String, email: String) -> Bool{
        let updateStatementString = "UPDATE User SET first_name=?, last_name=?, address=?, city=?, country=? WHERE email=?;"
        var updateStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(updateStatement, 1, (first_name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (last_name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (city as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 5, (country as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 6, (email as NSString).utf8String, -1, nil)

            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("User updated successfully!")
                sqlite3_finalize(updateStatement)
                return true
            } else {
                print("Couldn't update any row?")
                return false
            }
        } else {
            print("UPDATE statement failed to succeed!!!")
            return false
        }
    }
    
    // Create cruise table
    func createCruiseTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Cruise (id INTEGER PRIMARY KEY, name TEXT, price INTEGER);"
        
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
    
    // Add new cruise table
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
    
    // Delete a cruise from Cruise table
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
