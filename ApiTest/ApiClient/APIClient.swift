//
//  APIClient.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation

@Observable
class APIClient {
    
    private func responseType(statusCode: Int) -> ResponseType {
        switch statusCode {
        case 100..<200:
            print("Informativo: a requisição foi recebida e o processo continua.")
            return .informational
        case 200..<300:
            print("Sucesso: a requisição foi bem-sucedida.")
            return .success
        case 300..<400:
            print("Redirecionamento: ação adicional é necessária para completar a requisição.")
            return .redirection
        case 400..<500:
            print("Erro do cliente: a requisição contém sintaxe incorreta ou não pode ser atendida.")
            return .clientError
        case 500..<600:
            print("Erro do servidor: o servidor falhou ao completar uma requisição válida.")
            return .serverError
        default:
            print("Código de status desconhecido.")
            return .unknown
        }
    }
    
    
    
    private func createURL(name: String) -> URL? { //criar a url de forma organizada
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        
        components.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: name),
            URLQueryItem(name: "client_id", value: "wONFCqj-9Grqvy3vdbXEs0-i03XBuIyD4WtYICDx4MQ") // esconder essa chave
        ]
                
        return components.url
    }
    
    func fetchImage(name: String) async ->  Result<PhotoResponse, APIError>{
        
        guard let url = createURL(name: name) else {
            return .failure(.invalidURL)// se a url foi errada
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse else{
                return .failure(.invalidResponse)
            }
            
             let responseType = self.responseType(statusCode: response.statusCode)
            
            switch responseType {
            case .clientError, .serverError, .unknown, .informational, .redirection:
                return .failure(.invalidResponse)
            case .success:
                let photoResponse = try JSONDecoder().decode(PhotoResponse.self, from: data)
                return .success(photoResponse)
            }
            
            
        } catch(let error){
            return .failure(.APIError(error))
        }
        
    }
    
    
}
