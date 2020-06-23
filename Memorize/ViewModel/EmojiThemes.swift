//
//  EmojiThemes.swift
//  Memorize
//
//  Created by Armind Chahal on 6/22/20.
//  Copyright © 2020 Armind Chahal. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var accentColor: Color
}

let halloween = Theme(name: "Halloween", emojis: ["👻", "🎃", "💀", "👾", "😈", "👹"], accentColor: .orange)
let smileys = Theme(name: "Smileys", emojis: ["😄", "😎", "😅", "😀", "😊", "😌", "😂"], accentColor: .yellow)
let weather = Theme(name: "Weather", emojis: ["⛈", "❄️", "🌦", "🌤", "🌩", "🌬", "🌪"], accentColor: .blue)
let moon = Theme(name: "Moon", emojis: ["🌑", "🌒", "🌔", "🌕", "🌖", "🌘", "🌙"], accentColor: .gray)
let food = Theme(name: "Food", emojis: ["🧀", "🧇", "🌯", "🧈", "🌭", "🍉", "🍋"], accentColor: .red)
let animals = Theme(name: "Animals", emojis: ["🦙", "🦛", "🦝", "🦘", "🦚", "🦧", "🐘"], accentColor: .green)

let themes = [halloween, smileys, weather, moon, food, animals]



