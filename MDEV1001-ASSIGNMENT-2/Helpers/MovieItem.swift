//
//  MovieItem.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct MovieItemView: View {
    var item: MovieModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string:item.thumbnailUrl ?? "https://upload.wikimedia.org/wikipedia/en/thumb/1/18/Benedict_Cumberbatch_as_Doctor_Strange.jpeg/220px-Benedict_Cumberbatch_as_Doctor_Strange.jpeg")) { image in
                image
                    .resizable()
                    .scaledToFit()
                //                    .aspectRatio(contentMode: .fill)
                //                    .frame(width: 200, height: 200)
                //                    .background(Color.yellow)
            } placeholder: {
                Image("no-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            Text(item.title ?? "Doctor Strange")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
            
            Text(item.studio ?? "Walt Disney")
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .lineLimit(3)

            
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.trailing, 2)
                
                Text(item.criticsRating ?? "7.8")
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }

        }
        .frame(width: 180, height: 340)
    }
}

#Preview {
    MovieItemView(item: previewModel)
}
