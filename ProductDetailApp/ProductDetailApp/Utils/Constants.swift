//
//
//  Constants.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 01/02/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import Foundation


struct Constants {
//    Titlew
    static let firstViewTitle = "Product Detail"
    static let searchPlaceHolder = "Busca tus productos..."
    static let caracteristicTitle = "Características"
    
//    button titles
    static let startButtonTitle = "Empezar"
    static let nextButtonTitle = "Siguiente"
    static let searchScopeButtonTitles = ["Todos", "Motorola", "Xiaomi", "Iphone", "Samsung"]
    static let allScopeButtonTitle = "Todos"
    static let acpet = "Aceptar"
    static let retry = "Volver a intentar"
    static let understood = "Entendido"
    
    //    Colors
    struct Colors {
        static let darkBlue = "DarkBlue"
        static let purple = "Purple"
        static let gray = "Gray"
    }
    
//    ViewController
    static let homeNavigationController = "homeNavigationController"
    
//    Other
    static let noAvailableLabel = "No disponible"
    
//    Error
    static let failureTitle = "URL Invalida o Expiró"
    static let failureMessage = "LA URL no existe o expiró, \ncomuniquese con nuestra atencion al cliente"
    static let requestTitle = "Error de Conexión"
    static let requestMessage = "Volve a intentarlo en unos minutos"
    static let errorTitle = "URL Invalida o Expiró"
    static let errorMessage = "Error al intentar cargar los datos"
}
