//
//
//  HomeViewInteractor.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import Foundation

enum connectionError {
    case failureResponse
    case requestFail
    case errorData
    case errorDecodingJson
    case error
}

class HomeViewInteractor: HomeViewInteractorProtocol {
    var presenter: HomeViewPresenterProtocol?

    func fetch() {
        guard let url = constructURL() else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.presenter?.showError(.requestFail)
                print("Error en la solicitud:", error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.presenter?.showError(.failureResponse)
                print("Respuesta del servidor no exitosa")
                return
            }

            guard let data = data else {
                self.presenter?.showError(.errorData)
                print("No se recibieron datos")
                return
            }

            do {
                let products = try JSONDecoder().decode(Products.self, from: data)
                let productList = products.results
                DispatchQueue.main.async {
                    self.presenter?.getProduct(product: productList)
                }
            } catch let decodingError as DecodingError {
                self.presenter?.showError(.errorDecodingJson)
                print("Error decoding JSON:", decodingError)
            } catch let error as NSError {
                self.presenter?.showError(.error)
            }
        }.resume()
    }
    
    func constructURL() -> URL? {
        guard let url = URL(string: "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055") else {
            // Aquí puedes manejar el caso en el que la URL no se puede construir, por ejemplo, mostrando un error
            return nil
        }
        
        return url
    }
}

