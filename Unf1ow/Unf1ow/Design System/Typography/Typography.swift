//
//  Typography.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import Foundation
import SwiftUI

extension Text {
    func category() -> some View {
        self
            .font(.formulaOne(weight: .semibold, style: .caption))
            .lineLimit(1)
            .foregroundColor(.red)
    }
    
    func body() -> some View {
        self
            .font(.formulaOne(weight: .regular, style: .subheadline))
            .lineLimit(3)
            .foregroundColor(.primary)
    }
}
