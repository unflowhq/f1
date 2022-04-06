//
//  ContentView.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI
import UnflowUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ContainerView {
                List {
                    content
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    UnflowSDK.client.sync()
                }
            }
            .navigationTitle("UNF1OW")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var content: some View {
        OpenerView { openers in
            ForEach(openers) { opener in
                Group {
                    if openers.first == opener {
                        HeroView(
                            title: "TOP NEWS",
                            imageURL: opener.imageURL ?? "",
                            category: "NEWS",
                            subtitle: opener.subtitle ?? ""
                        )
                    } else {
                        ArticleView(
                            imageURL: opener.imageURL ?? "",
                            category: opener.title,
                            subtitle: opener.subtitle ?? ""
                        )
                    }
                }
                .onTapGesture {
                    try? UnflowSDK.client.openScreen(withID: opener.id)
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .padding(.top, 16)
        .padding(.trailing, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
