//
//  usuarios.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit

class usuarios: NSObject {
    var sUsuario:String?
    
    init(valores:[String:AnyObject]) {
        sUsuario=valores["Usuario"] as? String
        
    }
}
