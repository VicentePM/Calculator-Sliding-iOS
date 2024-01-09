//
//  Juego.swift
//  Ejercicio 5
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class Juego: UIViewController {
    
    
    @IBOutlet weak var stackPadre: UIStackView!
    @IBOutlet weak var hijoUno: UIStackView!
    @IBOutlet weak var hijoDos: UIStackView!
    @IBOutlet weak var hijoTres: UIStackView!
    @IBOutlet weak var botonUno: UIButton!
    @IBOutlet weak var botonDos: UIButton!
    @IBOutlet weak var botonTres: UIButton!
    @IBOutlet weak var botonCuatro: UIButton!
    @IBOutlet weak var botonCinco: UIButton!
    @IBOutlet weak var botonSeis: UIButton!
    @IBOutlet weak var botonSiete: UIButton!
    @IBOutlet weak var botonOcho: UIButton!
    @IBOutlet weak var botonVacio: UIButton!
    @IBOutlet weak var viewGanado: UIView!
    
    var tableMatrix = [[UIButton]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewGanado.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var botones: [UIButton] = [
            botonUno,
            botonDos,
            botonTres,
            botonCuatro,
            botonCinco,
            botonSeis,
            botonSiete,
            botonOcho,
            botonVacio
        ]
        
        deleteFirstButtons()
        addButtons(botones: &botones)
        
    }
    
    
    @IBAction func moveButton(_ sender: UIButton) {
        changeButtonPosition(matrix: tableMatrix, button: sender)
    }
    
    
    func deleteFirstButtons(){
        for stack in stackPadre.arrangedSubviews {
            for button in stack.subviews {
                button.removeFromSuperview()
            }
        }
    }
    
    
    
    func addButtons(botones: inout [UIButton]) {
        
        let botonesAzar = botones.shuffled()
        
        for (index, boton) in botonesAzar.enumerated() {
            switch index {
            case 0...2:
                hijoUno.addArrangedSubview(boton)
            case 3...5:
                hijoDos.addArrangedSubview(boton)
            case 6...8:
                hijoTres.addArrangedSubview(boton)
            default:
                break
            }
        }
        
        addButtonsToMatrix(matrix: &tableMatrix, array: botonesAzar)
        
    }
    
    func addButtonsToMatrix(matrix: inout [[UIButton]], array: [UIButton]) {
        
        var contador = 0
        
        for row in stackPadre.arrangedSubviews as! [UIStackView] {
            matrix.append([UIButton]())
            for col in row.arrangedSubviews {
                matrix[contador].append(col as! UIButton)
            }
            contador += 1
        }
        
        print(matrix)
    }
    
    func changeButtonPosition(matrix: [[UIButton]], button: UIButton) {
        
        var xPos = 0
        var yPos = 0
        
        for row in 0...2 {
            for col in 0...2 {
                if matrix[row][col] == button {
                    xPos = row
                    yPos = col
                    break
                }
            }
        }
        
        switch xPos {
        case 0: if matrix[xPos + 1][yPos] == botonVacio {
            changeVertPosition(xPos: xPos, yPos: yPos, newPos: 1)}
        case 1: if matrix[xPos + 1][yPos] == botonVacio {
            changeVertPosition(xPos: xPos, yPos: yPos, newPos: 1)}
            else if matrix[xPos - 1][yPos] == botonVacio {
                changeVertPosition(xPos: xPos, yPos: yPos, newPos: -1)
            }
        default: if matrix[xPos - 1][yPos] == botonVacio {
            changeVertPosition(xPos: xPos, yPos: yPos, newPos: -1)}
        }
        
        switch yPos {
        case 0: if matrix[xPos][yPos + 1] == botonVacio {
            changeHorizPosition(xPos: xPos, yPos: yPos, newPos: 1)}
        case 1: if matrix[xPos][yPos + 1] == botonVacio {
            changeHorizPosition(xPos: xPos, yPos: yPos, newPos: 1)}
            else if matrix[xPos][yPos - 1] == botonVacio {
                changeHorizPosition(xPos: xPos, yPos: yPos, newPos: -1)
            }
        default: if matrix[xPos][yPos - 1] == botonVacio {
            changeHorizPosition(xPos: xPos, yPos: yPos, newPos: -1)}
        }
        
    }
    
    func changeHorizPosition(xPos: Int, yPos: Int, newPos: Int) {
        
        let aux = tableMatrix[xPos][yPos]
        
        tableMatrix [xPos][yPos] = botonVacio
        tableMatrix[xPos][yPos + newPos] = aux
        redraw()
    }
    
    func changeVertPosition(xPos: Int, yPos: Int, newPos: Int) {
        
        let aux = tableMatrix[xPos][yPos]
        
        tableMatrix [xPos][yPos] = botonVacio
        tableMatrix[xPos + newPos][yPos] = aux
        redraw()
    }
    
    func redraw() {
        deleteFirstButtons()
        
        var x = 0
        var y = 0
        
        for row in stackPadre.arrangedSubviews as! [UIStackView] {
            y = 0
            while y < 3 {
                row.addArrangedSubview(tableMatrix[x][y])
                y += 1
            }
            x += 1
        }
        
        compGanador()
    }
    
    func compGanador() {
        let botones: [String?] = [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            nil
        ]
        
        var contador = 0
        var win = true
        
        for row in tableMatrix {
            for col in row {
                if col.titleLabel?.text != botones[contador] {
                    win = false
                    break
                }
                contador += 1
            }
        }
        
        if(win) {
            viewGanado.isHidden = false
        }
    }
}
