//
//  Selections.swift
//  Select
//
//  Created by Buğra Akgün on 28.10.2025.
//

import Foundation
import UIKit

class Selections{
    var eventtext : String
    var image : UIImage
    var type1 : Int
    var type2 : Int
    var option1 : String
    var option2 : String
    
    init(selectioneventtext: String,selectionimage: UIImage,selectiontype1: Int,selectiontype2: Int,selectionoption1: String,selectionoption2: String) {
        eventtext = selectioneventtext
        image = selectionimage
        type1 = selectiontype1
        type2 = selectiontype2
        option1 = selectionoption1
        option2 = selectionoption2
    }
    
}
