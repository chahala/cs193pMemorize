//
//  Array+Only.swift
//  Memorize
//
//  Created by Armind Chahal on 6/22/20.
//  Copyright © 2020 Armind Chahal. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
