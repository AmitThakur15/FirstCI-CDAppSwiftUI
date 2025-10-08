//
//  ArticleView.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI
import UIKit
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            // TODO: Add image view
            if let image = article.imageUrl,
               let url = URL(string: image){
                
                URLImage(url, identifier: url.absoluteString) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                   ProgressView()
                } failure: { error, retry in
                    // Display error and retry button
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .environment(\.urlImageOptions,
                              .init(fetchPolicy: .returnStoreElseLoad(downloadDelay: nil)))

            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }

            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(article.title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.sourceName)
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleView(article: Article.mock)
//            .previewLayout(.sizeThatFits)
//    }
//}
