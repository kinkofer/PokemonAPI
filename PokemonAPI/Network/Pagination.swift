//
//  Pagination.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


/// The state of a paginated web service call.
public enum PaginationState<T> {
    /// Required state the first time you call the paginated web service.
    case initial(pageLimit: Int)
    /// Used on subsequent calls to the paginated web service, getting results for that relationship.
    case continuing(PKMPagedObject<T>, PaginationRelationship)
}


/// Public enum representing the different positions for pagination relative to the last fetch
public enum PaginationRelationship {
    case first
    case last
    case next
    case previous
    /// - note: pages are zero-index
    case page(Int)
}



/// Paged Object
public class PKMPagedObject<T>: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    /// The total number of resources available from this API
    public private(set) var count: Int?
    
    /// The url for the next page in the list
    private(set) var next: String?
    
    /// The url for the previous page in the list
    private(set) var previous: String?
    
    /// The url for the current page
    public private(set) var current: String = ""
    
    /// List of named API resources
    public private(set) var results: [PKMAPIResource<T>]?
    
    /// The number of results returned on each page
    private(set) var limit: Int = 0
    
    /// The current offset for the web service
    private(set) var offset: Int = 0
    
    /// The number of pages produced based of the pageLimit
    public var pages: Int {
        guard let count = count else {
            return 0
        }
        return Int((Float(count) / Float(limit)).rounded(.up))
    }
    
    /// The current zero-index page based on the current offset and pageLimit
    public var currentPage: Int {
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count)
        self.next = try container.decodeIfPresent(String.self, forKey: .next)
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous)
        do {
            self.results = try container.decodeIfPresent([PKMNamedAPIResource].self, forKey: .results)
        } catch {
            self.results = try container.decodeIfPresent([PKMAPIResource].self, forKey: .results)
        }
    }
    
    
    
    // MARK: - Update
    
    /// Update PagedObject's offset, limit, and current url. These properties are not returned from the web service
    /// so must be updated from the previous values.
    func update<T>(with paginationState: PaginationState<T>, currentUrl: String) {
        switch paginationState {
        case .initial(let limit):
            self.offset = 0
            self.limit = limit
        case .continuing(let pagedObject, let relationship):
            self.offset = pagedObject.getOffset(for: relationship)
            self.limit = pagedObject.limit
        }
        
        self.current = currentUrl
    }
    
    
    
    // MARK: -
    
    /// Returns the offset for the next paginated web service call based on the requested relationship.
    func getOffset(for relationship: PaginationRelationship) -> Int {
        switch relationship {
        case .first: return 0
        case .last:
            guard let count = count else {
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
