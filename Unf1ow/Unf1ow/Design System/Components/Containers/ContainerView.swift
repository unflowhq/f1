//
//  ContainerView.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var readableWidth: CGFloat {
        UIViewController().view.readableContentGuide.layoutFrame.width
    }
    
    private var content: () -> (Content)
    
    init(@ViewBuilder _ content: @escaping () -> (Content)) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground).edgesIgnoringSafeArea(.all)
            content()
                .frame(width: readableWidth, alignment: .center)
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            Text("hello.")
        }
    }
}
