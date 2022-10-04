//
//  Extentions.swift
//  Netfix clone
//
//  Created by Soham.C.Athawale on 04/10/22.
//

import Foundation

extension String{
    func capitalizefirstletter()->String{
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
