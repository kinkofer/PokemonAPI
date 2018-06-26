//
//  Pagination.swift
//  PokemonKit
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


/// The state of a paginated web service call.
public enum PaginationState {
    /// Required state the first time you call the paginated web service.
    case initial(pageLimit: Int)
    /// Used on subsequent calls to the paginated web service, getting results for that relationship.
    case continuing(PaginatedResult, PaginationRelationship)
}


/// Public enum representing the different positions for pagination relative to the last fetch
public enum PaginationRelationship {
    case first
    case last
    case next
    case previous
    /// - note: pages are zero-index
    case page(Int)
    
    
    var name: String {
        switch self {
        case .first: return "first"
        case .last: return "last"
        case .next: return "next"
        case .previous: return "previous"
        default:
            return ""
        }
    }
}


/// A struct containing optional url strings to relative links of a PaginatedResult
struct PageLink {
    var first: String?
    var last: String?
    var next: String?
    var previous: String?
}



/// Struct representing the pagination state for a single call
public struct PaginatedResult {
    /// The Data from the web service result
    public var value: Data
    /// URLs available to call based on relationships to the current web service call.
    private var pageLink: PageLink
    
    /// The number of objects returned
    public let pageLimit: Int
    /// The current offset of the total results
    private let offset: Int
    
    /// Total count of objects for that web service call
    public let total: Int
    
    /// The number of pages produced based of the pageLimit
    public var pages: Int {
        return Int(Float(total / pageLimit).rounded(.up))
    }
    
    /// The current zero-index page based on the current offset and pageLimit
    public var currentPage: Int {
        return Int(Float(offset / pageLimit).rounded(.down))
    }
    
    /// True if there are additional results that can be retrieved
    public var hasNext: Bool {
        return pageLink.next != nil
    }
    
    /// True if there are previous results that can be retrieved
    public var hasPrevious: Bool {
        return pageLink.previous != nil
    }
    
    
    // MARK: - Init
    
    init(value: Data, pageLink: PageLink, pageLimit: Int, offset: Int, total: Int) {
        self.value = value
        
        self.pageLink = pageLink
        self.pageLimit = pageLimit
        self.offset = offset
        self.total = total
    }
    
    
    
    // MARK: -
    
    /// Returns the offset for the next paginated web service call based on the requested relationship.
    func getOffset(for relationship: PaginationRelationship) -> Int {
        switch relationship {
        case .first: return 0
        case .last:
            let remainingCount = total % pageLimit
            return total - remainingCount
        case .next: return min(offset + pageLimit, getOffset(for: .last))
        case .previous: return max(offset - pageLimit, 0)
        case .page(let page):
            guard page >= 0 else {
                return 0
            }
            
            guard page <= pages else {
                return getOffset(for: .last)
            }
            
            return page * pageLimit
        }
    }
    
    
    /// Returns the url string of a current relationship if it exists
    func getPageLink(for relationship: PaginationRelationship) -> String? {
        switch relationship {
        case .first: return self.pageLink.first
        case .last: return self.pageLink.last
        case .next: return self.pageLink.next
        case .previous: return self.pageLink.previous
        case .page(let page):
            let offset = getOffset(for: .page(page))
            // FIXME: Replace offset for desired page
            return nil
        }
    }
}
