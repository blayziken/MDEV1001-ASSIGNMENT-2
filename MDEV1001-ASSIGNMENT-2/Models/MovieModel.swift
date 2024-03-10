//
//  MovieModel.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import Foundation

struct MovieModel: Identifiable, Decodable, Hashable {
    let id = UUID()
    var title: String?
    var thumbnailUrl: String?
    var directors: String?
    var actors: String?
    var genres: String?
    var writers: String?
    var description: String?
    var mpaRating: String?
    var criticsRating: String?
    var length: String?
    var studio: String?
    var year: String?
}


var previewModel = MovieModel(
    title: "Preview",
    thumbnailUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/1/18/Benedict_Cumberbatch_as_Doctor_Strange.jpeg/220px-Benedict_Cumberbatch_as_Doctor_Strange.jpeg"
)
