//
//  Font.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import Foundation
import SwiftUI

extension Font {
    static func formulaOne(weight: Font.Weight, style: Font.TextStyle) -> Font {
        let size: CGFloat = style.size
        
        switch weight {
        case .bold:
            return .custom("TitilliumWeb-Bold", size: size, relativeTo: style)
        case .semibold:
            return .custom("TitilliumWeb-SemiBold", size: size, relativeTo: style)
        case .light:
            return .custom("TitilliumWeb-Light", size: size, relativeTo: style)
        default:
            return .custom("TitilliumWeb-Regular", size: size, relativeTo: style)
        }
    }
}

// Copied from Apple's HIGs so we can maintain the type hierarchy with our own fonts.
extension Font.TextStyle {
    var size: CGFloat {
        let size: CGFloat
        switch self {
        case .largeTitle:
            size = 34
        case .title:
            size = 28
        case .title2:
            size = 22
        case .title3:
            size = 20
        case .headline:
            size = 17
        case .body:
            size = 17
        case .callout:
            size = 16
        case .subheadline:
            size = 15
        case .footnote:
            size = 13
        case .caption:
            size = 12
        case .caption2:
            size = 11
        @unknown default:
            size = 17
        }
        return size
    }
}
