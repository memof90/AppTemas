//
//  Equipo.swift
//  AppTemas
//
//  Created by Memo Figueredo on 5/10/19.
//  Copyright © 2019 DeTodoUnPoquito. All rights reserved.
//

import UIKit

class Equipo {
    
    //MARK:Propiedades
    var nombre: String
    var photo : UIImage?
    var rating : Int
    
    
    
    
    //MARK: Inicializador
    init?(nombre: String, photo: UIImage?, rating: Int) {
        
        //// La inicialización debería fallar si no hay nombre o si la calificación es negativa.
        if nombre.isEmpty || rating < 0 {
            
            return nil
        }

        
        //alamacena la foto y el nombre y la calificacion propuestas por el usuario
        self.nombre = nombre
        self.photo = photo
        self.rating = rating
    }
}
