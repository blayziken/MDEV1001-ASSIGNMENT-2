//
//  HomeView.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct HomeView: View {
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                        ForEach(0...19, id: \.self) { item in
                            MovieItemView(item: previewModel)
                            
                            
                        }
                    }
                }
                
                Button {
                    self.isActive = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .clipShape(Circle())
                        .shadow(radius: 5, x: 0, y: 3)
                }
                .padding()
                
                NavigationLink(
                    destination: AddMovieView(),
                    isActive: $isActive,
                    label: { EmptyView() }
                )
                
                
            }
            .navigationTitle("MOVIES")
        }
        
    }
}

#Preview {
    HomeView()
}

