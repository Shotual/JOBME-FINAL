//
//  DataHolder.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseStorage

class DataHolder: NSObject {
    var uid:String?

    static let sharedInstance:DataHolder=DataHolder()
    var firDatabaseRef: DatabaseReference!
    var Usuario:User?
    var Pass:String?
    var Uss:String?
    var firStorage:Storage?
   
    var firStorageRef:StorageReference!
    var contadorOferta: Int?
    
    
    override init (){
        
    }
    func initFirebase(){
        FirebaseApp.configure()
        firDatabaseRef=Database.database().reference()
        firStorage = Storage.storage()
        firStorageRef = (firStorage?.reference())!
    }
}
