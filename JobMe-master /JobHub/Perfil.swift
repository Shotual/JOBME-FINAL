//
//  Perfil.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//
import UIKit

class Perfil: NSObject {
    var Imagen:UIImage?
    var Tipo:Int?
    
    override init() {
        
    }
    
    init(valores:[String:AnyObject]) {
        Imagen = valores ["Imagen"] as? UIImage
        Tipo = valores ["Tipo"] as? Int
    }
    
    func getPerfil() -> [String:AnyObject] {
        var hm:[String:AnyObject]=[:]
        hm["Tipo"]=Tipo! as AnyObject
        
        return hm
    }
    
    
}
