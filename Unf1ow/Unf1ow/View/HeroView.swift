//
//  HeroView.swift
//  Unf1ow
//
//  Created by Alex Logan on 25/03/2022.
//

import SwiftUI

struct HeroView: View {
    let title: String
    let imageURL: String
    let category: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            FormulaOneContainerView(style: .header) {
                Text(title)
                    .font(.formulaOne(weight: .bold, style: .title2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
            }

            image
            
            FormulaOneContainerView {
                VStack(alignment: .leading, spacing: 8) {
                    Text(category)
                        .category()
                    Text(subtitle)
                        .body()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            }
        }
        .padding(.trailing, 8)
    }

    var image: some View {
        ArticleImage(imageURL: imageURL)
    }
}

struct ArticleImage: View {
    var imageURL: String

    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, alignment: .center)
            .aspectRatio(1.66, contentMode: .fit)
            .foregroundColor(.clear)
            .background(
                AsyncImage(
                    url: URL(string: imageURL),
                    transaction: Transaction(animation: .easeInOut),
                    content: { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .aspectRatio(contentMode: .fill)
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        } else {
                            EmptyView()
                                .transition(.opacity)
                        }
                    })
                    .transition(.opacity)
            )
            .clipped()
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(
            title: "TOP STORY",
            imageURL: "https://media-cdn.mclaren.com/media/images/articles/hero/Google_Announcement_website_2022.jpg",
            category: "NEWS",
            subtitle: "McLaren signs landmark deal with tech giant Google to bring the future of mobile to the future of racing"
        )
    }
}
