//
//  RatingControl.swift
//  AppTemas
//
//  Created by Memo Figueredo on 5/8/19.
//  Copyright © 2019 DeTodoUnPoquito. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK:Propiedades
    private var ratingBotones = [UIButton]()
    
    //añadir el ancho y alto
    @IBInspectable var tamanoEstrena : CGSize = CGSize(width: 44.0, height: 44.0){
        
        //llama al observador de propiedades tamanoEstreña agregando nuevos botones
        didSet{
            construccionBotones()
        }

    }
    
    //contador de estreñas agrega 5 botones
    @IBInspectable var contadorEstrena : Int = 5{
        //llama al observador de propiedades contadorEstrena
        didSet{
            construccionBotones()
        }
    }
    
    
    //Contador 5 botones
    var rating = 0 {
        didSet{
            actualizarEstadoBoton()
        }
    }

    //MARK: Inicialización
    override init(frame: CGRect) {
        super.init(frame: frame)
        construccionBotones()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        construccionBotones()
    }
    
    //MARK:Metodos Privados
    private func construccionBotones(){
        
        //borrar los botones antiguos
        for boton in ratingBotones{
            removeArrangedSubview(boton)
            boton.removeFromSuperview()
        }
        
        ratingBotones.removeAll()
        
        
        //agregar imagenes
        let bundle = Bundle(for: type(of: self))
        let estrenallena = UIImage(named: "estrenallena", in: bundle, compatibleWith: self.traitCollection)
        
        let estrenaResaltadora = UIImage(named: "estrenaResaltadora", in: bundle, compatibleWith: self.traitCollection)
        
        let estrenaVacia = UIImage(named: "estrenaVacia", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<contadorEstrena {
        //crear boton
        let boton = UIButton()
        //pasar las imagenes
        
        boton.setImage(estrenaVacia, for: .normal)
        boton.setImage(estrenallena, for: .selected)
        boton.setImage( estrenaResaltadora , for: .highlighted)
        boton.setImage( estrenaResaltadora , for: [.highlighted,.selected])
        
        //añadir constrains
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.heightAnchor.constraint(equalToConstant: tamanoEstrena.height).isActive = true
        boton.widthAnchor.constraint(equalToConstant: tamanoEstrena.width).isActive = true
        
        //colocar la accion al boton
        boton.addTarget(self, action: #selector(RatingControl.ratingBotonpresionado(boton:)), for: .touchUpInside)
        
            //enviar accecibilidad al label con voiceOver
            boton.accessibilityLabel = "cambiar \(index + 1) cambio estreña"
        
        //añadir el boton a la vista
        addArrangedSubview(boton)
        
            //añadir un nuevo boton al rating boton array
        ratingBotones.append(boton)
        }
        
        actualizarEstadoBoton()
    }
    
    //MARK: comprobacion Boton
    @objc func ratingBotonpresionado(boton: UIButton){
        
        //establcemos la condicion todos los botones coge el primerIndex del arreglo si este no se encuentra el boton en el arreglo me manda un error
        guard let index = ratingBotones.firstIndex(of: boton) else {
            fatalError("el boton, \(boton) no se encuentra en el array de ratingBotones:\(ratingBotones)")
        }
        
        //calaculamos el control de la seleccion del boton
        let seleccionRating = index + 1
        if seleccionRating == rating {
            
            //Si la estrella seleccionada representa la calificación actual, reinicie la calificación a 0.
            rating = 0
        } else {
            
            // De lo contrario, establece la calificación de la estrella seleccionada
            rating = seleccionRating
        }
        
        
        
        print("boton presionado 👊")
    }
    
   
    
    //metodo que actualiza la aparencia del boton
    private func actualizarEstadoBoton(){
        
        for (index, boton) in ratingBotones.enumerated(){
            
            //Si el índice de un botón es menor que la clasificación, ese botón debería estar seleccionado.
            boton.isSelected = index < rating
            
            //Establecer la voiceOver de pista para la estrella seleccionada actualmente
            let  pistaString: String?
            
            if rating == index + 1 {
                pistaString = "Toque para reestablcer la calificación a cero"
            } else {
                
                pistaString = nil
            }
            
           //calcular el valor de la estreña
            let valorString : String
            
            switch (rating) {
            case 0 :
                valorString = "sin calificación establecida"
            case 1:
                valorString = "1 estreña calicación"
            default:
                valorString = "\(rating) estreñas de calificacion"
            }
            
            boton.accessibilityHint = pistaString
            boton.accessibilityValue = valorString
        }
    }
    
    

}
