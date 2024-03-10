//
//  MovieController.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import Foundation
import SwiftUI

final class MovieViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var thumbnailUrl: String = ""
    @Published var directors: String = ""
    @Published var genres: String = ""
    @Published var actors: String = ""
    @Published var writers: String = ""
    @Published var description: String = ""
    @Published var mpaRating: String = ""
    @Published var criticsRating: String = ""
    @Published var year: String = ""
    @Published var length: String = ""
    @Published var studio: String = ""
    
    @Published var isShowingDetail: Bool = false
    @Published var selectedMovie: MovieModel?
    @Published var selectedCoreDataMovie: MovieItem?
    
}

