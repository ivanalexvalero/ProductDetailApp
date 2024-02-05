
import Foundation

//struct Products: Decodable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Products: Decodable {
    let countryDefaultTimeZone: String
    let paging: Paging?
    let results: [Result]
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]
    let pdpTracking: PDPTracking

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case paging
        case results
        case sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
        case pdpTracking = "pdp_tracking"
    }
    // MARK: - Paging
    struct Paging: Decodable {
        let total: Int?
        let primaryResults: Int?
        let offset: Int?
        let limit: Int?

        enum CodingKeys: String, CodingKey {
            case total
            case primaryResults = "primary_results"
            case offset
            case limit
        }
    }

    // MARK: - AvailableFilter
    struct AvailableFilter: Decodable {
        let id, name: String
        let type: TypeEnum
        let values: [AvailableFilterValue]
    }

    enum TypeEnum: String, Decodable {
        case boolean = "boolean"
        case list = "list"
        case number = "number"
        case range = "range"
        case string = "STRING"
        case text = "text"
    }

    // MARK: - AvailableFilterValue
    struct AvailableFilterValue: Decodable {
        let id, name: String
        let results: Int
    }

    // MARK: - Sort
    struct Sort: Codable {
        let id, name: String
    }

    // MARK: - Filter
    struct Filter: Decodable {
        let id, name: String
        let type: TypeEnum
        let values: [FilterValue]
    }

    // MARK: - FilterValue
    struct FilterValue: Decodable {
        let id: CategoryID
        let name: String
        let pathFromRoot: [Sort]

        enum CodingKeys: String, CodingKey {
            case id, name
            case pathFromRoot = "path_from_root"
        }
    }

    enum CategoryID: String, Decodable {
        case mla1055 = "MLA1055"
    }

    // MARK: - PDPTracking
    struct PDPTracking: Decodable {
        let group: Bool
        let productInfo: [ProductInfo]

        enum CodingKeys: String, CodingKey {
            case group
            case productInfo = "product_info"
        }
    }

    // MARK: - ProductInfo
    struct ProductInfo: Decodable {
        let id: String
        let score: Int
        let status: Status
    }

    enum Status: String, Decodable {
        case shown = "shown"
    }

    // MARK: - Result
    struct Result: Decodable {
        let id: String
        let title: String
        let condition: Condition
        let thumbnailID, catalogProductID: String
        let listingTypeID: ListingTypeID
        let permalink: String
        let buyingMode: BuyingMode
        let categoryID: CategoryID
        let domainID: DomainID
        let thumbnail: String
        let currencyID: CurrencyID
        let orderBackend: Int
        let price: Double?
        let originalPrice: Float?
        let availableQuantity: Int
        let officialStoreID: Int?
        let officialStoreName: String?
        let useThumbnailID, acceptsMercadopago: Bool
        let stopTime: String
        let seller: Seller
        let attributes: [Attribute]
        let installments: Installments
        let catalogListing: Bool
        let differentialPricing: DifferentialPricing?
        let inventoryID: String?
        let siteID: String // Agrega esta línea

        enum CodingKeys: String, CodingKey {
            case id, title, condition
            case thumbnailID = "thumbnail_id"
            case catalogProductID = "catalog_product_id"
            case listingTypeID = "listing_type_id"
            case permalink
            case buyingMode = "buying_mode"
            case siteID = "site_id"
            case categoryID = "category_id"
            case domainID = "domain_id"
            case thumbnail
            case currencyID = "currency_id"
            case orderBackend = "order_backend"
            case price
            case originalPrice = "original_price"
            case availableQuantity = "available_quantity"
            case officialStoreID = "official_store_id"
            case officialStoreName = "official_store_name"
            case useThumbnailID = "use_thumbnail_id"
            case acceptsMercadopago = "accepts_mercadopago"
            case stopTime = "stop_time"
            case seller, attributes, installments
            case catalogListing = "catalog_listing"
            case differentialPricing = "differential_pricing"
            case inventoryID = "inventory_id"
        }
    }


    // MARK: - Attribute
    struct Attribute: Decodable {
        let id: ID
        let name: Name
        let valueID, valueName: String?
        let attributeGroupID: AttributeGroupID
        let attributeGroupName: AttributeGroupName
        let values: [AttributeValue]
        let source: Int
        let valueType: ValueType

        enum CodingKeys: String, CodingKey {
            case id, name
            case valueID = "value_id"
            case valueName = "value_name"
            case attributeGroupID = "attribute_group_id"
            case attributeGroupName = "attribute_group_name"
            case values, source
            case valueType = "value_type"
        }
    }

    enum AttributeGroupID: String, Decodable {
        case others = "OTHERS"
    }

    enum AttributeGroupName: String, Decodable {
        case otros = "Otros"
    }

    enum ID: String, Codable {
        case brand = "BRAND"
        case detailedModel = "DETAILED_MODEL"
        case gpuModel = "GPU_MODEL"
        case itemCondition = "ITEM_CONDITION"
        case line = "LINE"
        case model = "MODEL"
        case packageLength = "PACKAGE_LENGTH"
        case packageWeight = "PACKAGE_WEIGHT"
        case processorModel = "PROCESSOR_MODEL"
        case weight = "WEIGHT"
    }

    enum Name: String, Decodable {
        case condiciónDelÍtem = "Condición del ítem"
        case largoDelPaquete = "Largo del paquete"
        case línea = "Línea"
        case marca = "Marca"
        case modelo = "Modelo"
        case modeloDeGPU = "Modelo de GPU"
        case modeloDelProcesador = "Modelo del procesador"
        case modeloDetallado = "Modelo detallado"
        case peso = "Peso"
        case pesoDelPaquete = "Peso del paquete"
    }

    // MARK: - Struct
    struct Struct: Decodable {
        let number: Double
        
        enum CodingKeys: String, CodingKey {
            case number

        }
    }



    enum ValueType: String, Decodable {
        case list = "list"
        case numberUnit = "number_unit"
        case string = "string"
    }

    // MARK: - AttributeValue
    struct AttributeValue: Decodable {
        let id, name: String?
        let valueStruct: Struct?
        let source: Int

        enum CodingKeys: String, CodingKey {
            case id, name
            case valueStruct = "struct"
            case source
        }
    }

    enum BuyingMode: String, Decodable {
        case buyItNow = "buy_it_now"
    }

    enum Condition: String, Decodable {
        case new = "new"
    }

    enum CurrencyID: String, Decodable {
        case ars = "ARS"
    }

    // MARK: - DifferentialPricing
    struct DifferentialPricing: Decodable {
        let id: Int
    }

    enum DomainID: String, Decodable {
        case mlaCellphones = "MLA-CELLPHONES"
    }

    // MARK: - Installments
    struct Installments: Decodable {
        let quantity: Int
        let amount, rate: Double
        let currencyID: CurrencyID

        enum CodingKeys: String, CodingKey {
            case quantity, amount, rate
            case currencyID = "currency_id"
        }
    }

    enum ListingTypeID: String, Decodable {
        case goldPro = "gold_pro"
        case goldSpecial = "gold_special"
    }

    // MARK: - Seller
    struct Seller: Decodable {
        let id: Int
        let nickname: String
    }
}


