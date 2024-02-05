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
    
//    Slide constants
    static let firstSlideTitle = "Navega por la app"
    static let secondSlideTitle = "Busca el producto perfecto para vos"
    static let thirdSlideTitle = "Mira todas las caracteristicas del producto"
    static let firstSlideDescription =  "Puedes ver todos los productos diponibles que tenemos para vos desde la Home"
    static let secondSlideDescription = "Animate a encontrar ese producto ideal para vos en todo nuestro catalogo de manera mas fluida y rapida"
    static let thirdSlideDescription = "Dale click y mira toda la informacion de nuestro producto al instante. Colores, forma y tipo de material. Y sabras mas de él"
    static let firstSlideImage = "1"
    static let secondSlideImage = "2"
    static let thirdSlideImage = "3"
    
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
