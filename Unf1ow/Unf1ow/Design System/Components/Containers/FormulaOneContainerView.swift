//
//  FormulaOneContainerView.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI


struct FormulaOneContainerStyle {
    static let header = FormulaOneContainerStyle(
        weight: .emphasised,
        orientation: .top,
        color: .red
    )
    static let standard = FormulaOneContainerStyle(
        weight: .standard,
        orientation: .bottom,
        color: Color(UIColor.secondaryLabel)
    )
    
    enum Weight {
        case standard, emphasised
        
        var lineWidth: CGFloat {
            switch self {
            case .standard:
                return 1.5
            case .emphasised:
                return 2
            }
        }
    }
    
    enum Orientation {
        case top, bottom
    }
    
    let weight: Weight
    let orientation: Orientation
    let color: Color
}

struct FormulaOneContainerView<Content: View>: View {
    
    let content: () -> (Content)
    let style: FormulaOneContainerStyle

    init(
        style: FormulaOneContainerStyle = .standard,
        @ViewBuilder _ contentBuilder: @escaping () -> (Content)) {
        self.content = contentBuilder
        self.style = style
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                FormulaOneBorderShape(orientation: style.orientation)
                    .stroke(
                        style: .init(
                            lineWidth: style.weight.lineWidth,
                            lineCap: .round,
                            lineJoin: .round,
                            miterLimit: 5,
                            dash: [],
                            dashPhase: 0
                        )
                    )
                    .frame(maxWidth: .infinity, minHeight: 44, alignment: .leading)
                    .foregroundColor(style.color)
            )
    }
}


struct FormulaOneBorderShape: Shape {
    var orientation: FormulaOneContainerStyle.Orientation
    
    func path(in rect: CGRect) -> Path {
        let startY: CGFloat = orientation == .top ? rect.minY : rect.maxY
        let endY: CGFloat = orientation == .top ? rect.maxY : rect.minY
        let curveStartX: CGFloat = orientation == .top ? rect.maxX-20 : rect.maxX-20
        let curveEndY: CGFloat = orientation == .top ? rect.minY+20 : rect.maxY-20

        let startPoint = CGPoint(x: rect.minX, y: startY)
        let trailingPointCurveStart = CGPoint(x: curveStartX, y: startY)
        let trailingPoint = CGPoint(x: rect.maxX, y: startY)
        let trailingPointCurveEnd = CGPoint(x: rect.maxX, y: curveEndY)
        let endPoint = CGPoint(x: rect.maxX, y: endY)
            
        return Path { path in
            path.move(to: startPoint)
            path.addLine(to: trailingPointCurveStart)
            path.addQuadCurve(to: trailingPointCurveEnd, control: trailingPoint)
            path.addLine(to: endPoint)
        }
    }
}


struct FormulaOneContainerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormulaOneContainerView(style: .header) {
                Text("One!")
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
            }
            FormulaOneContainerView(style: .standard) {
                Text("Two!")
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
            }
        }
        .padding()
    }
}
