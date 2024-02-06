//
//
//  ProductDetailAppTests.swift
//  ProductDetailAppTests
//  ProductDetailAppTests
//
//  Created by Iván Valero on 05/02/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import XCTest
@testable import ProductDetailApp

@MainActor class ProductDetailAppTests: XCTestCase {
    var sut: HomeViewViewController?
    var sutDetail: ProductDetailViewController?
    var interactor: HomeViewInteractor?
    let expectation = XCTestExpectation(description: "Error alert presented")
    let mockPresenter = MockPresenter()
    
    override func setUp() {
        super.setUp()
        // Pantalla HomeViewViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewViewController") as? HomeViewViewController
        sut?.loadViewIfNeeded()
        
        // Pantalla ProductDetailViewController
        sutDetail = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: nil)
        sutDetail?.loadViewIfNeeded()
        
        interactor = HomeViewInteractor()
    }
    
    override func tearDown() {
        sut = nil
        sutDetail = nil
        interactor = nil
        super.tearDown()
    }
    
    func testTableViewDataSource() {
        // Llama al metodo
        sut?.configTableView()
        
        // Test
        XCTAssertNotNil(sut?.productTableView.dataSource, "La fuente de datos de la tabla no se configuró correctamente")
        XCTAssertTrue(sut?.productTableView.dataSource is HomeViewViewController, "La fuente de datos de la tabla no es del tipo esperado")
    }
    
    func testTableViewDelegate() {
        // Llama al metodo
        sut?.configTableView()
        
        // Test
        XCTAssertNotNil(sut?.productTableView.delegate, "El delegado de la tabla no se configuró correctamente")
        XCTAssertTrue(sut?.productTableView.delegate is HomeViewViewController, "El delegado de la tabla no es del tipo esperado")
    }
    
    
    func testTitleLabel() {
        // Configurar estado inicial
        let product = Products.Result.makeTestProduct(id: "01", title: "Titulo de prueba", thumbnail: "https//:image", price: 100.0, originalPrice: 200.0, officialStoreName: "Store de prueba", attributes: [.init(valueName: "Value Name de prueba")])
        
        // Llama al método que deseas probar
        sutDetail?.selectedProduct = product
        sutDetail?.setupData()
        
        // Test
        XCTAssertEqual(sutDetail?.titleProductDetailLabel.text, "Titulo de prueba", "El título no coincide con el esperado")
        XCTAssertNotEqual(sutDetail?.priceProductDetailLabel.text, String(100.0), "El precio no coincide con el de prueba")
        XCTAssertNil(sutDetail?.imageProductDetailImageView.image)
        XCTAssertNotEqual(sutDetail?.storeNameProductDetailLabel.text, "Store", "El store no coincide con el esperado")
    }

    func testURLConstruction() {
        // URL del interactor
        let constructedURL = interactor?.constructURL()
        
        // URL esperada
        let expectedURLString = "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055"
        guard let expectedURL = URL(string: expectedURLString) else {
            XCTFail("Error al crear la URL esperada")
            return
        }
        
        // Test
        XCTAssertEqual(constructedURL, expectedURL, "La URL construida no coincide con la esperada")
    }
    
    func testShowErrorAlert() {
        // mockPresenter
        sut?.presenter = mockPresenter

        // fetch es nil
        mockPresenter.fetchToBeCalled = nil

        // Metodo
        sut?.showErrorAlert(title: "Error", message: "Something went wrong", ctaTitle: "OK")

        // Verificación
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertFalse(self.mockPresenter.fetchCalled, "Si fetch es nil, deberia llamarse al alert")
            XCTAssertFalse(self.mockPresenter.additionalActionPerformed, "Funcion Adicional en false al ser nil el fetch")
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testNoShowErrorAlert() {
        // mockPresenter
        sut?.presenter = mockPresenter

        // fetch es correcto
        mockPresenter.fetch()

        // Metodo
        sut?.showErrorAlert(title: "Error", message: "Volve a intentar en unos minutos", ctaTitle: "Aceptar")

        // Verificación
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(self.mockPresenter.fetchCalled, "La funcion fetch obtiene los datos correctamente, no deberia llamarse al alert")
            XCTAssertTrue(self.mockPresenter.additionalActionPerformed, "Funcion Adicional en true")
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

class MockPresenter: HomeViewPresenter {
    var fetchCalled = false
    var fetchToBeCalled: (() -> Void)?
    var additionalActionPerformed = false

    override func fetch() {
        fetchCalled = true
        fetchToBeCalled?()
        additionalActionPerformed = true
    }
}

extension Products.Result {
    static func makeTestProduct(id: String, title: String, thumbnail: String, price: Double?, originalPrice: Float?, officialStoreName: String?, attributes: [Products.Attribute]) -> Products.Result {
        
        return Products.Result(id: id,
                               title: title,
                               thumbnail: "thumbnail",
                               price: price,
                               originalPrice: originalPrice,
                               officialStoreName: officialStoreName,
                               attributes: attributes)
    }
}
