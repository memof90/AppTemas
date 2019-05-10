//
//  ViewController.swift
//  AppTemas
//
//  Created by Memo Figueredo on 5/7/19.
//  Copyright © 2019 DeTodoUnPoquito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //MARK: conexiones
    @IBOutlet weak var LabelTexto: UILabel!
    
    @IBOutlet weak var nombreEquipo: UITextField!
    
   
    @IBOutlet weak var ImagenVista: UIImageView!
    
    
    @IBOutlet weak var ratingControl: RatingControl!
    

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreEquipo.delegate = self
    }
    
    //MARK: uiTextFiledDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        LabelTexto.text = textField.text
    }
    
    //MARK: uIimagePicekrControllerDelagate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Yo pueda cancelar la orden de sellecion de una imagen
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        ImagenVista.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // contiene la imagen original que se selecciono, una version de una imagen editada
    //envie la imagen a la app en ejecucion
    //descatar imagen
    
    //MARK: Acciones
    
    @IBAction func enviar(_ sender: UIButton) {
        
        LabelTexto.text = "Cual es Tu Equipo"
    }
    
    
    @IBAction func seleccionImagen(_ sender: UITapGestureRecognizer) {
        
        nombreEquipo.resignFirstResponder()
        
        //UiImagePickerController
        // Permite es coger la imagen por el usuario
        let imagePickerController = UIImagePickerController()
        //selecciona las imagenes dispositivo
        imagePickerController.sourceType = .photoLibrary
        //notifica al viewcontroller usamos una foto de la biblioteca
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
  

}
