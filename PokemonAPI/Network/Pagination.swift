//
//  Pagination.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


/// The state of a paginated web service call.
public enum PaginationState<T>: Sendable {
    /// Required state the first time you call the paginated web service.
    case initial(pageLimit: Int, offset: Int = 0)
    /// Used on subsequent calls to the paginated web service, getting results for that relationship.
    case continuing(PKMPagedObject<T>, PaginationRelationship)
}


/// Public enum representing the different positions for pagination relative to the last fetch
public enum PaginationRelationship: Sendable {
    case first
    case last
    case next
    case previous
    /// - note: pages are zero-index
    case page(Int)
}



/// Paged Object
public struct PKMPagedObject<T>: Codable, Sendable {
    public typealias PKMObject = T
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    /// The total number of resources available from this API
    public let count: Int?
    
    /// The url for the next page in the list
    let next: String?
    
    /// The url for the previous page in the list
    let previous: String?
    
    /// The url for the current page
    let current: String
    
    /// List of API resources (some services return named resources and can be cast as [PKMAPIResource])
    public let results: [PKMAPIResource<T>]?
    
    /// The number of results returned on each page
    public let limit: Int
    
    /// The current offset for the web service
    public let offset: Int
    
    /// The number of pages produced based on the pageLimit
    public var pages: Int {
        guard let count = count, limit != 0 else {
            return 0
        }
        return Int((Float(count) / Float(limit)).rounded(.up))
    }
    
    /// The current zero-index page based on the current offset and pageLimit
    public var currentPage: Int {
        guard limit != 0 else { return 0 }
        return offset / limit
    }
    
    /// True if there are additional results that can be retrieved
    public var hasNext: Bool {
        return next != nil
    }
    
    /// True if there are previous results that can be retrieved
    public var hasPrevious: Bool {
        return previous != nil
    }
    
    
    
    // MARK: - Init
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count)
        self.next = try container.decodeIfPresent(String.self, forKey: .next)
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous)
        self.results = try container.decodeIfPresent([PKMAPIResource].self, forKey: .results)
        
        offset = 0
        limit = 0
        current = ""
    }
    
    
    public init(from pagedObject: PKMPagedObject, with paginationState: PaginationState<PKMObject>, currentUrl: String) {
        results = pagedObject.results
        count = pagedObject.count
        next = pagedObject.next
        previous = pagedObject.previous
        
        switch paginationState {
        case .initial(let newLimit, let newOffset):
            offset = newOffset
            limit = newLimit
        case .continuing(let pagedObject, let relationship):
            offset = pagedObject.getOffset(for: relationship)
            limit = pagedObject.limit
        }
        
        current = currentUrl
    }
    
    
    
    // MARK: -
    
    /// Returns the offset for the next paginated web service call based on the requested relationship.
    func getOffset(for relationship: PaginationRelationship) -> Int {
        switch relationship {
        case .first: return 0
        case .last:
            guard let count = count, limit != 0 else {
                return 0
            }
            let remainingCount = count % limit
            return count - remainingCount
        case .next: return min(offset + limit, getOffset(for: .last))
        case .previous: return max(offset - limit, 0)
        case .page(let page):
            guard page >= 0 else {
                return 0
            }
            
            guard page <= pages else {
                return getOffset(for: .last)
            }
            
            return page * limit
        }
    }
    
    
    /// Returns the url string of a current relationship if it exists
    public func getPageLink(for relationship: PaginationRelationship) -> String? {
        switch relationship {
        case .first:
            guard var url = URL(string: current) else {
                return nil
            }
            url.appendQuery(parameters: ["offset": "0"])
            return url.absoluteString
        case .last:
            guard var url = URL(string: current) else {
                return nil
            }
            url.appendQuery(parameters: ["offset": String(getOffset(for: .last))])
            return url.absoluteString
        case .next: return self.next
        case .previous: return self.previous
        case .page(let page):
            guard var url = URL(string: current) else {
                return nil
            }
            url.appendQuery(parameters: ["offset": String(getOffset(for: .page(page)))])
            return url.absoluteString
        }
    }
}
