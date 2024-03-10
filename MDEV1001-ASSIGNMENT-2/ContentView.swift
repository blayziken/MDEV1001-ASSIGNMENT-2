//
//  ContentView.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: MovieItem.entity(), sortDescriptors: [])
    private var items: FetchedResults<MovieItem>
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    @State private var isActive: Bool = false
    @StateObject var viewModel = MovieViewModel()

    var body: some View {
        NavigationView {
            ZStack() {
                ScrollView {
                    
                    LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            
                            MovieItemView(item: MovieModel(
                                title: item.title,
                                thumbnailUrl: item.thumbnailUrl,
                                criticsRating: item.criticsRating,
                                studio: item.studio
                                )
                            )
                            .onTapGesture {
                                viewModel.selectedMovie = MovieModel(
                                    title: item.title,
                                    thumbnailUrl: item.thumbnailUrl,
                                    criticsRating: item.criticsRating,
                                    studio: item.studio
                                    )
                                viewModel.isShowingDetail = true
                                viewModel.selectedCoreDataMovie = item
                                
                            }
//                            .gesture(longPressToDelete(item: item.title ?? "Doctor Strange"))
                        }
                    }
                }

                //                VStack {
//                    Spacer()
//                    HStack {
//                        Button {
//                            self.isActive = true
//                        } label: {
//                            Image(systemName: "plus")
//                                .font(.title2.weight(.bold))
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(.orange)
//                                .clipShape(Circle())
//                                .shadow(radius: 5, x: 0, y: 3)
//                        }
//                        .padding()
//                        
//                        
//                    }
//                }
                
                NavigationLink(
                    destination: AddMovieView(),
                    isActive: $isActive,
                    label: { EmptyView() }
                )
                
                if(viewModel.isShowingDetail) {
                    DetailView(
                        movie: viewModel.selectedMovie!,
                        isShowingDetail: $viewModel.isShowingDetail,
                        deleteFunction: {
                            deleteMovie(item: viewModel.selectedMovie!.title ?? "Doctor Strange")
                        }
                    )
//                    .alignmentGuide(.top) {
//                        $0[VerticalAlignment.center]
//                    }
                }
            }
            .navigationTitle("Movies")
//            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        self.isActive = true
                    } label: {
                        
                        Image(systemName: "plus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .clipShape(Circle())
                            .shadow(radius: 5, x: 0, y: 3)
                    }
                }
            }
           

        }
        .onAppear{
            preloadData()
        }
    }
   
    func deleteMovie(item:String) {
        if let index = items.firstIndex(where: { $0.title == item }) {
            viewContext.delete(items[index])
            saveContext()
        }
    }
    
    func findFetchedMovieItem(item:String) {
        if let index = items.firstIndex(where: { $0.title == item }) {
            viewContext.delete(items[index])
            saveContext()
        }
    }
    
    func longPressToDelete(item: String) -> some Gesture {
           LongPressGesture(minimumDuration: 1.0)
               .onEnded { _ in
                   if let index = items.firstIndex(where: { $0.title == item }) {
//                       items.remove(at: index)
                       viewContext.delete(items[index])
                   }
               }
       }
    
    private func deleteItem(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    
    func preloadData() {
        guard let url = Bundle.main.url(forResource: "movieData", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let itemsArray = try decoder.decode([MovieModel].self, from: data)
            
            for itemData in itemsArray {
                addItem(itemData: itemData)
            }
            saveContext()
        } catch {
            print("Error loading data: \(error.localizedDescription)")
        }
    }
    
    private func addItem(itemData: MovieModel) {
//        print(itemData)
//        print("-----+++------")
        withAnimation {
            
            if items.first(where:{$0.title == itemData.title}) == nil {
             
                let newItem = MovieItem(context:viewContext)
                
                newItem.directors = itemData.directors ?? ""
                newItem.title = itemData.title ?? ""
               
                newItem.thumbnailUrl = itemData.thumbnailUrl ?? ""
                newItem.actors = itemData.actors ?? ""
                newItem.genres = itemData.genres ?? ""
                newItem.writers = itemData.writers  ?? ""
                newItem.criticsRating = itemData.criticsRating ?? ""
                newItem.mpaRating = itemData.mpaRating ?? ""
                newItem.length = itemData.length ?? ""
                newItem.studio = itemData.studio ?? ""
                
                saveContext()
            }
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
    ContentView()
}
