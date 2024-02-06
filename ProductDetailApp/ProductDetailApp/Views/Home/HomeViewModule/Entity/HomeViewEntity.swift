
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
        let name: String
        let pathFromRoot: [Sort]

        enum CodingKeys: String, CodingKey {
            case name
            case pathFromRoot = "path_from_root"
        }
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
        let thumbnail: String
        let price: Double?
        let originalPrice: Float?
        let officialStoreName: String?
        let attributes: [Attribute]

        enum CodingKeys: String, CodingKey {
            case id, title
            case thumbnail
            case price
            case originalPrice = "original_price"
            case officialStoreName = "official_store_name"
            case attributes
        }
    }


    // MARK: - Attribute
    struct Attribute: Decodable {
        let valueName: String?

        enum CodingKeys: String, CodingKey {
            case valueName = "value_name"
        }
    }

    // MARK: - Struct
    struct Struct: Decodable {
        let number: Double
        
        enum CodingKeys: String, CodingKey {
            case number
        }
    }
}


