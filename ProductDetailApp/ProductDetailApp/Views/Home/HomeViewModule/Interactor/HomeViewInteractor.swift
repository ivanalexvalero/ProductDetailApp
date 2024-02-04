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

class HomeViewInteractor: HomeViewInteractorProtocol {
    var presenter: HomeViewPresenterProtocol?
    
    func fetch() {
        guard let url = URL(string: "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error en la solicitud:", error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Respuesta del servidor no exitosa")
                return
            }

            guard let data = data else {
                print("No se recibieron datos")
                return
            }

            do {
                let products = try JSONDecoder().decode(Products.self, from: data)
                
                // Accede directamente a la propiedad 'results'
                let productList = products.results
                
                DispatchQueue.main.async {
                    self.presenter?.getProduct(product: productList)
                    NotificationCenter.default.post(name: .modelUpdated, object: nil)
                }
            } catch {
                print("Error decoding JSON:", error)
            }

        }.resume()
    }
}
