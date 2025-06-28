//
//  AddPhotoView.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import SwiftUI

struct AddPhotoView: View {
    
    @State var viewModel = AddPhotoViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                
                AsyncImage(url: URL(string: viewModel.urlImageString ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                } placeholder: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 360, height: 300)
                        .overlay {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black.opacity(0.5))
                                .padding()
                        }
                }


                    .padding(.top, 30)
        
                TextField("Adicione o texto para buscar foto", text: $viewModel.name)
                    .textFieldStyle(CapsuleTextFieldStyle())
                    .padding(.top)
                    .padding(.horizontal, 20)
                
                Button {
                    Task{
                        await viewModel.getImage()
                    }
                } label: {
                    Text("Buscar")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
                
                Spacer()

            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //salvar foto na galeria
                    } label: {
                        Text("Salvar")
                    }

                }
        }

        }
    }
}

#Preview {
    AddPhotoView()
}
