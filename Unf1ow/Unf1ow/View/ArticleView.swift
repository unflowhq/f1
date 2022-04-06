//
//  ArticleView.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI

struct ArticleView: View {
    let imageURL: String
    let category: String
    let subtitle: String
    
    var body: some View {
        FormulaOneContainerView(style: .standard) {
            HStack(alignment: .top) {
                image
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(category)
                        .category()
                    Text(subtitle)
                        .body()
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.trailing, 8)
            }
        }
        .padding(.trailing, 8)
    }

    var image: some View {
        ArticleImage(imageURL: imageURL)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(
            imageURL: "https://media-cdn.mclaren.com/media/images/articles/hero/Google_Announcement_website_2022.jpg",
            category: "NEWS",
            subtitle: "McLaren signs landmark deal with tech giant Google to bring the future of mobile to the future of racing"
        )
    }
}
