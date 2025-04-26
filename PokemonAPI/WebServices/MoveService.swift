//
//  MoveService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMMoveService: HTTPWebService {
    func fetchMoveList(paginationState: PaginationState<PKMMove>) async throws -> PKMPagedObject<PKMMove>
    func fetchMove(_ moveID: Int) async throws -> PKMMove
    func fetchMove(_ moveName: String) async throws -> PKMMove
    func fetchMoveAilmentList(paginationState: PaginationState<PKMMoveAilment>) async throws -> PKMPagedObject<PKMMoveAilment>
    func fetchMoveAilment(_ moveAilmentID: Int) async throws -> PKMMoveAilment
    func fetchMoveAilment(_ moveAilmentName: String) async throws -> PKMMoveAilment
    func fetchMoveBattleStyleList(paginationState: PaginationState<PKMMoveBattleStyle>) async throws -> PKMPagedObject<PKMMoveBattleStyle>
    func fetchMoveBattleStyle(_ moveBattleStyleID: Int) async throws -> PKMMoveBattleStyle
    func fetchMoveBattleStyle(_ moveBattleStyleName: String) async throws -> PKMMoveBattleStyle
    func fetchMoveCategoryList(paginationState: PaginationState<PKMMoveCategory>) async throws -> PKMPagedObject<PKMMoveCategory>
    func fetchMoveCategory(_ moveCategoryID: Int) async throws -> PKMMoveCategory
    func fetchMoveCategory(_ moveCategoryName: String) async throws -> PKMMoveCategory
    func fetchMoveDamageClassList(paginationState: PaginationState<PKMMoveDamageClass>) async throws -> PKMPagedObject<PKMMoveDamageClass>
    func fetchMoveDamageClass(_ moveDamageClassID: Int) async throws -> PKMMoveDamageClass
    func fetchMoveDamageClass(_ moveDamageClassName: String) async throws -> PKMMoveDamageClass
    func fetchMoveLearnMethodList(paginationState: PaginationState<PKMMoveLearnMethod>) async throws -> PKMPagedObject<PKMMoveLearnMethod>
    func fetchMoveLearnMethod(_ moveLearnMethodID: Int) async throws -> PKMMoveLearnMethod
    func fetchMoveLearnMethod(_ moveLearnMethodName: String) async throws -> PKMMoveLearnMethod
    func fetchMoveTargetList(paginationState: PaginationState<PKMMoveTarget>) async throws -> PKMPagedObject<PKMMoveTarget>
    func fetchMoveTarget(_ moveTargetID: Int) async throws -> PKMMoveTarget
    func fetchMoveTarget(_ moveTargetName: String) async throws -> PKMMoveTarget
}



// MARK: - Web Services

public struct MoveService: PKMMoveService, Sendable {
    public enum API: APICall {
        case fetchMoveList
        case fetchMoveByID(Int)
        case fetchMoveByName(String)
        case fetchMoveAilmentList
        case fetchMoveAilmentByID(Int)
        case fetchMoveAilmentByName(String)
        case fetchMoveBattleStyleList
        case fetchMoveBattleStyleByID(Int)
        case fetchMoveBattleStyleByName(String)
        case fetchMoveCategoryList
        case fetchMoveCategoryByID(Int)
        case fetchMoveCategoryByName(String)
        case fetchMoveDamageClassList
        case fetchMoveDamageClassByID(Int)
        case fetchMoveDamageClassByName(String)
        case fetchMoveLearnMethodList
        case fetchMoveLearnMethodByID(Int)
        case fetchMoveLearnMethodByName(String)
        case fetchMoveTargetList
        case fetchMoveTargetByID(Int)
        case fetchMoveTargetByName(String)
        
        var path: String {
            switch self {
            case .fetchMoveList:
                return "/move"
            case .fetchMoveByID(let id):
                return "/move/\(id)"
            case .fetchMoveByName(let name):
                return "/move/\(name)"
            case .fetchMoveAilmentList:
                return "/move-ailment"
            case .fetchMoveAilmentByID(let id):
                return "/move-ailment/\(id)"
            case .fetchMoveAilmentByName(let name):
                return "/move-ailment/\(name)"
            case .fetchMoveBattleStyleList:
                return "/move-battle-style"
            case .fetchMoveBattleStyleByID(let id):
                return "/move-battle-style/\(id)"
            case .fetchMoveBattleStyleByName(let name):
                return "/move-battle-style/\(name)"
            case .fetchMoveCategoryList:
                return "/move-category"
            case .fetchMoveCategoryByID(let id):
                return "/move-category/\(id)"
            case .fetchMoveCategoryByName(let name):
                return "/move-category/\(name)"
            case .fetchMoveDamageClassList:
                return "/move-damage-class"
            case .fetchMoveDamageClassByID(let id):
                return "/move-damage-class/\(id)"
            case .fetchMoveDamageClassByName(let name):
                return "/move-damage-class/\(name)"
            case .fetchMoveLearnMethodList:
                return "/move-learn-method"
            case .fetchMoveLearnMethodByID(let id):
                return "/move-learn-method/\(id)"
            case .fetchMoveLearnMethodByName(let name):
                return "/move-learn-method/\(name)"
            case .fetchMoveTargetList:
                return "/move-target"
            case .fetchMoveTargetByID(let id):
                return "/move-target/\(id)"
            case .fetchMoveTargetByName(let name):
                return "/move-target/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Moves list
     */
    public func fetchMoveList(paginationState: PaginationState<PKMMove> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMove> {
        try await callPaginated(endpoint: API.fetchMoveList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveID: Move ID
     */
    public func fetchMove(_ moveID: Int) async throws -> PKMMove {
        try await PKMMove.decode(from: call(endpoint: API.fetchMoveByID(moveID)))
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveName: Move Name
     */
    public func fetchMove(_ moveName: String) async throws -> PKMMove {
        try await PKMMove.decode(from: call(endpoint: API.fetchMoveByName(moveName)))
    }
    
    
    /**
     Fetch Moves Ailments list
     */
    public func fetchMoveAilmentList(paginationState: PaginationState<PKMMoveAilment> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveAilment> {
        try await callPaginated(endpoint: API.fetchMoveAilmentList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentID: Move Ailment ID
     */
    public func fetchMoveAilment(_ moveAilmentID: Int) async throws -> PKMMoveAilment {
        try await PKMMoveAilment.decode(from: call(endpoint: API.fetchMoveAilmentByID(moveAilmentID)))
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentName: Move Ailment Name
     */
    public func fetchMoveAilment(_ moveAilmentName: String) async throws -> PKMMoveAilment {
        try await PKMMoveAilment.decode(from: call(endpoint: API.fetchMoveAilmentByName(moveAilmentName)))
    }
    
    
    /**
     Fetch Moves Battle Styles list
     */
    public func fetchMoveBattleStyleList(paginationState: PaginationState<PKMMoveBattleStyle> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveBattleStyle> {
        try await callPaginated(endpoint: API.fetchMoveBattleStyleList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleID: Move Battle Style ID
     */
    public func fetchMoveBattleStyle(_ moveBattleStyleID: Int) async throws -> PKMMoveBattleStyle {
        try await PKMMoveBattleStyle.decode(from: call(endpoint: API.fetchMoveBattleStyleByID(moveBattleStyleID)))
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleName: Move Battle Style Name
     */
    public func fetchMoveBattleStyle(_ moveBattleStyleName: String) async throws -> PKMMoveBattleStyle {
        try await PKMMoveBattleStyle.decode(from: call(endpoint: API.fetchMoveByName(moveBattleStyleName)))
    }
    
    
    /**
     Fetch Moves Categories list
     */
    public func fetchMoveCategoryList(paginationState: PaginationState<PKMMoveCategory> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveCategory> {
        try await callPaginated(endpoint: API.fetchMoveCategoryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryID: Move Category ID
     */
    public func fetchMoveCategory(_ moveCategoryID: Int) async throws -> PKMMoveCategory {
        try await PKMMoveCategory.decode(from: call(endpoint: API.fetchMoveCategoryByID(moveCategoryID)))
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryName: Move Category Name
     */
    public func fetchMoveCategory(_ moveCategoryName: String) async throws -> PKMMoveCategory {
        try await PKMMoveCategory.decode(from: call(endpoint: API.fetchMoveCategoryByName(moveCategoryName)))
    }
    
    
    /**
     Fetch Moves Damage Classes list
     */
    public func fetchMoveDamageClassList(paginationState: PaginationState<PKMMoveDamageClass> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveDamageClass> {
        try await callPaginated(endpoint: API.fetchMoveDamageClassList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassID: Move Damage Class ID
     */
    public func fetchMoveDamageClass(_ moveDamageClassID: Int) async throws -> PKMMoveDamageClass {
        try await PKMMoveDamageClass.decode(from: call(endpoint: API.fetchMoveDamageClassByID(moveDamageClassID)))
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassName: Move Damage Class Name
     */
    public func fetchMoveDamageClass(_ moveDamageClassName: String) async throws -> PKMMoveDamageClass {
        try await PKMMoveDamageClass.decode(from: call(endpoint: API.fetchMoveDamageClassByName(moveDamageClassName)))
    }
    
    
    /**
     Fetch Moves Learn Methods list
     */
    public func fetchMoveLearnMethodList(paginationState: PaginationState<PKMMoveLearnMethod> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveLearnMethod> {
        try await callPaginated(endpoint: API.fetchMoveLearnMethodList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodID: Move Learn Method ID
     */
    public func fetchMoveLearnMethod(_ moveLearnMethodID: Int) async throws -> PKMMoveLearnMethod {
        try await PKMMoveLearnMethod.decode(from: call(endpoint: API.fetchMoveLearnMethodByID(moveLearnMethodID)))
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    public func fetchMoveLearnMethod(_ moveLearnMethodName: String) async throws -> PKMMoveLearnMethod {
        try await PKMMoveLearnMethod.decode(from: call(endpoint: API.fetchMoveLearnMethodByName(moveLearnMethodName)))
    }
    
    
    /**
     Fetch Moves Targets list
     */
    public func fetchMoveTargetList(paginationState: PaginationState<PKMMoveTarget> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMoveTarget> {
        try await callPaginated(endpoint: API.fetchMoveTargetList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetID: Move Target ID
     */
    public func fetchMoveTarget(_ moveTargetID: Int) async throws -> PKMMoveTarget {
        try await PKMMoveTarget.decode(from: call(endpoint: API.fetchMoveTargetByID(moveTargetID)))
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetName: Move Target Name
     */
    public func fetchMoveTarget(_ moveTargetName: String) async throws -> PKMMoveTarget {
        try await PKMMoveTarget.decode(from: call(endpoint: API.fetchMoveTargetByName(moveTargetName)))
    }
}
