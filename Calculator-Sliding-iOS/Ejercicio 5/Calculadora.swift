//
//  Calculadora.swift
//  Ejercicio 5
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class Calculadora: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var numeroCero: UIButton!
    @IBOutlet weak var numeroUno: UIButton!
    @IBOutlet weak var numeroDos: UIButton!
    @IBOutlet weak var numeroTres: UIButton!
    @IBOutlet weak var numeroCuatro: UIButton!
    @IBOutlet weak var numeroCinco: UIButton!
    @IBOutlet weak var numeroSeis: UIButton!
    @IBOutlet weak var numeroSiete: UIButton!
    @IBOutlet weak var numeroOcho: UIButton!
    @IBOutlet weak var numeroNueve: UIButton!
    @IBOutlet weak var botonBorrarTodo: UIButton!
    @IBOutlet weak var botonBorrar: UIButton!
    @IBOutlet weak var botonAbs: UIButton!
    @IBOutlet weak var punto: UIButton!
    @IBOutlet weak var botonDivision: UIButton!
    @IBOutlet weak var botonMultiplicacion: UIButton!
    @IBOutlet weak var botonResta: UIButton!
    @IBOutlet weak var botonSuma: UIButton!
    @IBOutlet weak var botonResultado: UIButton!
    
    var memoria: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardarMemoria(_ sender: Any) {
        memoria = resultado.text!
    }
    
    @IBAction func sumarMemoria(_ sender: Any) {
        if memoria != "" {
            let suma = Double(resultado.text!)! + Double(memoria)!
            resultado.text = String(describing: suma)
        }
    }
    
    @IBAction func restaMemoria(_ sender: Any) {
        if memoria != "" {
            let suma = Double(resultado.text!)! - Double(memoria)!
            resultado.text = String(describing: suma)
        }
    }
    
    @IBAction func borrarMemoria(_ sender: Any) {
        memoria = ""
    }
    
    @IBAction func valorAbsoluto(_ sender: Any) {
        resultado.text = String(describing: (Double(resultado.text!)! * -1))
    }
    
    @IBAction func suma(_ sender: Any) {
        if resultado.text != "0" {
            resultado.text! += "+"
        }
    }
    
    @IBAction func resta(_ sender: Any) {
        if resultado.text != "0" {
            resultado.text! += "-"
        } else {
            resultado.text! = "-"
        }
    }
    
    @IBAction func multiplicacion(_ sender: Any) {
        if resultado.text != "0" {
            resultado.text! += "*"
        }
    }
    
    @IBAction func division(_ sender: Any) {
        if resultado.text != "0" {
            resultado.text! += "/"
        }
    }
    
    @IBAction func mostrarResultado(_ sender: Any) {
        if let resultadoOperacion = NSExpression(format: resultado.text!).expressionValue(with: nil, context: nil) as? Double {
            resultado.text = "\(resultadoOperacion)"
        } else {
            resultado.text = "Error"
        }
    }
    
    @IBAction func borrar(_ sender: Any) {
        resultado.text = "0"
    }
    
    @IBAction func borrarTodo(_ sender: Any) {
        resultado.text = "0"
        memoria = "0"
    }
    
    @IBAction func introducirNumero(_ sender: Any) {
        if resultado.text == "0" {
            resultado.text = (sender as! UIButton).titleLabel?.text
        } else {
            resultado.text! += ((sender as! UIButton).titleLabel?.text)!
        }
    }
}
