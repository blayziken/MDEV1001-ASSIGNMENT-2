//
//  AddMovieView.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct AddMovieView: View {
    var isEdit: Bool = false
    var editSelectedMovie: MovieItem?

    
    @StateObject var viewModel = MovieViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
        NavigationView {
            VStack {
                
                if(isEdit) {
                    Text("Edit Movie")
                        .font(.title)
                } else {
                    Text("Add Movie")
                        .font(.title)
                }
             
                Form {
                    TextField("Title", text: $viewModel.title)
                        .padding(.vertical, 10)
                    
                    TextField("Studio", text: $viewModel.studio)
                        .padding(.vertical, 10)
                    
                    TextField("Critics Rating", text: $viewModel.criticsRating)
                        .padding(.vertical, 10)
                    
                    //                    TextField("Director", text: $viewModel.directors)
                    //                        .padding(.vertical, 10)
                    //
                    //                    TextField("Genres", text: $viewModel.genres)
                    //                        .padding(.vertical, 10)
                    //
                    //                    TextField("Actors", text: $viewModel.actors)
                    //                        .padding(.vertical, 10)
                    //
                    //                    TextField("Writers", text: $viewModel.writers)
                    //                        .padding(.vertical, 10)
                    //
                    //                    TextField("Description", text: $viewModel.description)
                    //                        .padding(.vertical, 10)
                    
                    //                    TextField("MPA Rating", text: $viewModel.mpaRating)
                    //                        .padding(.vertical, 10)
                    
                    //                    TextField("Year", text: $viewModel.year)
                    //                        .padding(.vertical, 10)
                    //
                    //                    TextField("Length", text: $viewModel.length)
                    //                        .padding(.vertical, 10)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Button {
                        
                        if(isEdit) {
                            editItem()
                        }else {
                            addItem(
                            title: viewModel.title,
                            studio: viewModel.studio,
                            criticsRating: viewModel.criticsRating
                            )
                        }
                        

                        presentationMode.wrappedValue.dismiss()

    
                    } label: {
                        Text(isEdit ? "Edit Movie" : "Add Movie")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                
            }
        }
        
        
    }
    
    private func editItem() {
        withAnimation {
            let newItem = MovieItem(context: viewContext)
            
            editSelectedMovie!.title =  "wahala"
            editSelectedMovie!.studio =  "wahala1"
            editSelectedMovie!.criticsRating =  "wahala3"
            saveContext()

        }
    }
    
    private func addItem(title: String, studio: String, criticsRating: String) {
        withAnimation {
            let newItem = MovieItem(context: viewContext)
//            newItem.id = UUID().uuidString
            newItem.title =  title
            newItem.studio = studio
            newItem.criticsRating =  criticsRating
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
            
        }
    }
}

#Preview {
    AddMovieView()
}
