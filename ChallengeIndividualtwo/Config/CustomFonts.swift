//
//  CustomFonts.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation
import UIKit

public func customFonts(name: String, size: CGFloat) -> UIFont {
    
    guard let customFont = UIFont(name: name, size: size) else {
        fatalError("""
            Failed to load the  font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """
    )}
    
    return customFont
    
}
