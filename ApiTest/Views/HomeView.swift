//
//  ContentView.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 27/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack {
//                Text("Busque fotos e adicione na sua galeria")
//                    .padding(50)
//                
//                Divider()
//                    .padding(.bottom, 20)
                
                ScrollView{
                    LazyVGrid(columns: viewModel.columns, spacing: 25) {
                        
                        ForEach((1...10).reversed(), id: \.self) {_ in 
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: viewModel.itemWidth, height: viewModel.itemHeight)
                                .overlay {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.black.opacity(0.5))
                                        .padding()
                                }
                                .padding(.horizontal)

                        }
                        .padding(.horizontal)
                        
//                        ForEach(viewModel.photos) { photo in
//                            NavigationLink {
//                                
//                            } label: {
//                                Color.gray
//                            }
//
//                        }
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
