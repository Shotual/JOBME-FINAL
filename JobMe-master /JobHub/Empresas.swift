//
//  Empresas.swift
//  JobHub
//
//  Created by Guille on 21/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit

class Empresas: NSObject {
    var sVa:String?
    var Ofertas:Array<Any>?
    
    init(valores:[String:AnyObject]) {
        Ofertas=(valores ["Ofertas"] as? Array<Any>)
    }

}
