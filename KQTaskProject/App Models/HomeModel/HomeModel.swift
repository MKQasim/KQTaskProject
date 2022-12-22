//
//  HomeModel.swift
//  KQTaskProject
//
//  Created by KamsQue on 21/12/2022.
//


import Foundation

// MARK: - HomeModel
struct HomeModel: Codable , Response {
    var code: Int?
    var message: String?
    var status, copyright: String?
    var numResults: Int?
    var results: [Post]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Post
public struct Post: Codable {
    var uri: String?
    var url: String?
    var id, assetID: Int?
    var source: String?
    var publishedDate, updated, section, subsection: String?
    var nytdsection, adxKeywords: String?
    var column: JSONNull?
    var byline: String?
    var type: ResultType?
    var title, abstract: String?
    var desFacet, orgFacet, perFacet, geoFacet: [String]?
    var media: [Media]?
    var etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

import Foundation

// MARK: - Media
struct Media: Codable {
    var type: MediaType?
    var subtype: Subtype?
    var caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MediaMetadatum.swift

// MARK: - MediaMetadatum
struct MediaMetadata: Codable {
    var url: String?
    var format: Format?
    var height, width: Int?
}

// Format.swift

import Foundation

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

// Subtype.swift

import Foundation

enum Subtype: String, Codable {
    case photo = "photo"
}

// MediaType.swift

import Foundation

enum MediaType: String, Codable {
    case image = "image"
}

// Source.swift

import Foundation

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

// ResultType.swift

import Foundation

enum ResultType: String, Codable {
    case article = "Article"
}

// JSONSchemaSupport.swift

import Foundation

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
