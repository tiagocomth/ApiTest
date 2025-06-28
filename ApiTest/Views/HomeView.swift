//
//  ContentView.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 27/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(sortDescriptors: [])
    var photos: FetchedResults<PhotoModel>
    
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView{
                    LazyVGrid(columns: viewModel.columns, spacing: 25) {
                        ForEach(photos) { photo in
                            AsyncImage(url: URL(string: photo.wrappedImage)!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: viewModel.itemWidth, height: viewModel.itemHeight)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                Text("placeholder")
                            }

                        }
                    }
                }
            }

            .sheet(isPresented: $viewModel.showAddPhotoView, content: {
                AddPhotoView()
                    .presentationDetents([.fraction(1)])
            })
            .navigationTitle("my photos")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showAddPhotoView = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }

                }
            }
            //.padding()
        }
    }
}

#Preview {
    HomeView()
}
