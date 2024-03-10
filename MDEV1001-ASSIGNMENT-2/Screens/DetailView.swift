//
//  DetailView.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct DetailView: View {
    let movie: MovieModel
    @StateObject var viewModel = MovieViewModel()

    @Binding var isShowingDetail: Bool
    var deleteFunction: () -> Void
    @State private var isActive: Bool = false

    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:movie.thumbnailUrl ?? "https://upload.wikimedia.org/wikipedia/en/thumb/1/18/Benedict_Cumberbatch_as_Doctor_Strange.jpeg/220px-Benedict_Cumberbatch_as_Doctor_Strange.jpeg")) { image in
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
            
            VStack {
                Spacer()
                    .frame(height: 15)
                Text(movie.title ?? "Doctor Strange")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(movie.studio ?? "Walt Disney")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.trailing, 3)
                    
                    Text(movie.criticsRating ?? "7.8")
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        
                        viewModel.title = movie.title!
                        viewModel.studio = movie.studio!
                        viewModel.criticsRating = movie.criticsRating!
                        
                        self.isActive = true

                        NavigationLink(
                            destination: AddMovieView(isEdit: true, editSelectedMovie: viewModel.selectedCoreDataMovie),
                            isActive: $isActive,
                            label: { EmptyView() }
                        )
                        
//                        isShowingDetail = false
                      
                    }label: {
                        
                        Text("Edit")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .tint(.brandPrimary)
                    .padding(.bottom, 30)
                    
                    Button {
                        deleteFunction()
                        isShowingDetail = false
                    }label: {
                        
                        Text("Delete")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .tint(.brandPrimary)
                    .padding(.bottom, 30)
                }
           
                NavigationLink(
                    destination: AddMovieView(isEdit: true, editSelectedMovie: viewModel.selectedCoreDataMovie),
                    isActive: $isActive,
                    label: { EmptyView() }
                )
            }
        }
        .frame(width: 320, height: 520)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }
        }
    }

}

#Preview {
    DetailView(movie: previewModel, isShowingDetail: .constant(true), deleteFunction: {
        
    })
}


