//
//  ContentView.swift
//  Networking
//
//  Created by Hariom Palkar on 26/10/20.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel = MovieViewModel() // change the model name acc to requirenments
    var body: some View {
        List(viewModel.movies) { movie in // 2
            HStack {
                VStack(alignment: .leading) {
                    Text(movie.title) // 3a
                        .font(.headline)
                    Text(movie.originalTitle) // 3b
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
