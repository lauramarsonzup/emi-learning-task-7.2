//
//  Raça.swift
//  LearningTask-7.2
//
//  Created by Laura Pinheiro Marson on 07/11/22.
//

import Foundation

struct Raça {
    let nome: String
    let imagem: String
    
    init(nome: String) {
        self.nome = nome
        self.imagem = nome
    }
}

extension Raça: DogViewCellData {}
