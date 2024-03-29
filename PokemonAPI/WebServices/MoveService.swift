//
//  MoveService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMMoveService: HTTPWebService {
    func fetchMoveList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMove
    func fetchMove(_ moveID: Int, completion: @escaping (_ result: Result<PKMMove, Error>) -> Void)
    func fetchMove(_ moveName: String, completion: @escaping (_ result: Result<PKMMove, Error>) -> Void)
    func fetchMoveAilmentList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveAilment
    func fetchMoveAilment(_ moveAilmentID: Int, completion: @escaping (_ result: Result<PKMMoveAilment, Error>) -> Void)
    func fetchMoveAilment(_ moveAilmentName: String, completion: @escaping (_ result: Result<PKMMoveAilment, Error>) -> Void)
    func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveBattleStyle
    func fetchMoveBattleStyle(_ moveBattleStyleID: Int, completion: @escaping (_ result: Result<PKMMoveBattleStyle, Error>) -> Void)
    func fetchMoveBattleStyle(_ moveBattleStyleName: String, completion: @escaping (_ result: Result<PKMMoveBattleStyle, Error>) -> Void)
    func fetchMoveCategoryList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveCategory
    func fetchMoveCategory(_ moveCategoryID: Int, completion: @escaping (_ result: Result<PKMMoveCategory, Error>) -> Void)
    func fetchMoveCategory(_ moveCategoryName: String, completion: @escaping (_ result: Result<PKMMoveCategory, Error>) -> Void)
    func fetchMoveDamageClassList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveDamageClass
    func fetchMoveDamageClass(_ moveDamageClassID: Int, completion: @escaping (_ result: Result<PKMMoveDamageClass, Error>) -> Void)
    func fetchMoveDamageClass(_ moveDamageClassName: String, completion: @escaping (_ result: Result<PKMMoveDamageClass, Error>) -> Void)
    func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveLearnMethod
    func fetchMoveLearnMethod(_ moveLearnMethodID: Int, completion: @escaping (_ result: Result<PKMMoveLearnMethod, Error>) -> Void)
    func fetchMoveLearnMethod(_ moveLearnMethodName: String, completion: @escaping (_ result: Result<PKMMoveLearnMethod, Error>) -> Void)
    func fetchMoveTargetList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveTarget
    func fetchMoveTarget(_ moveTargetID: Int, completion: @escaping (_ result: Result<PKMMoveTarget, Error>) -> Void)
    func fetchMoveTarget(_ moveTargetName: String, completion: @escaping (_ result: Result<PKMMoveTarget, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMove
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMove(_ moveID: Int) -> AnyPublisher<PKMMove, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMove(_ moveName: String) -> AnyPublisher<PKMMove, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveAilmentList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveAilment
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveAilment(_ moveAilmentID: Int) -> AnyPublisher<PKMMoveAilment, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveAilment(_ moveAilmentName: String) -> AnyPublisher<PKMMoveAilment, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveBattleStyle
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveBattleStyle(_ moveBattleStyleID: Int) -> AnyPublisher<PKMMoveBattleStyle, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveBattleStyle(_ moveBattleStyleName: String) -> AnyPublisher<PKMMoveBattleStyle, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveCategoryList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveCategory
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveCategory(_ moveCategoryID: Int) -> AnyPublisher<PKMMoveCategory, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveCategory(_ moveCategoryName: String) -> AnyPublisher<PKMMoveCategory, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveDamageClassList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveDamageClass
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveDamageClass(_ moveDamageClassID: Int) -> AnyPublisher<PKMMoveDamageClass, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveDamageClass(_ moveDamageClassName: String) -> AnyPublisher<PKMMoveDamageClass, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveLearnMethod
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveLearnMethod(_ moveLearnMethodID: Int) -> AnyPublisher<PKMMoveLearnMethod, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveLearnMethod(_ moveLearnMethodName: String) -> AnyPublisher<PKMMoveLearnMethod, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveTargetList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveTarget
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveTarget(_ moveTargetID: Int) -> AnyPublisher<PKMMoveTarget, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMoveTarget(_ moveTargetName: String) -> AnyPublisher<PKMMoveTarget, Error>
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMove
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMove(_ moveID: Int) async throws -> PKMMove
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMove(_ moveName: String) async throws -> PKMMove
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveAilmentList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveAilment
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveAilment(_ moveAilmentID: Int) async throws -> PKMMoveAilment
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveAilment(_ moveAilmentName: String) async throws -> PKMMoveAilment
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveBattleStyle
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveBattleStyle(_ moveBattleStyleID: Int) async throws -> PKMMoveBattleStyle
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveBattleStyle(_ moveBattleStyleName: String) async throws -> PKMMoveBattleStyle
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveCategoryList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveCategory
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveCategory(_ moveCategoryID: Int) async throws -> PKMMoveCategory
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveCategory(_ moveCategoryName: String) async throws -> PKMMoveCategory
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveDamageClassList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveDamageClass
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveDamageClass(_ moveDamageClassID: Int) async throws -> PKMMoveDamageClass
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveDamageClass(_ moveDamageClassName: String) async throws -> PKMMoveDamageClass
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveLearnMethod
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveLearnMethod(_ moveLearnMethodID: Int) async throws -> PKMMoveLearnMethod
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveLearnMethod(_ moveLearnMethodName: String) async throws -> PKMMoveLearnMethod
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveTargetList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveTarget
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveTarget(_ moveTargetID: Int) async throws -> PKMMoveTarget
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMoveTarget(_ moveTargetName: String) async throws -> PKMMoveTarget
}



// MARK: - Web Services

public struct MoveService: PKMMoveService {
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
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Moves list
     */
    public func fetchMoveList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMove {
        callPaginated(endpoint: API.fetchMoveList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveID: Move ID
     */
    public func fetchMove(_ moveID: Int, completion: @escaping (_ result: Result<PKMMove, Error>) -> Void) {
        call(endpoint: API.fetchMoveByID(moveID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveName: Move Name
     */
    public func fetchMove(_ moveName: String, completion: @escaping (_ result: Result<PKMMove, Error>) -> Void) {
        call(endpoint: API.fetchMoveByName(moveName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Ailments list
     */
    public func fetchMoveAilmentList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveAilment {
        callPaginated(endpoint: API.fetchMoveAilmentList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentID: Move Ailment ID
     */
    public func fetchMoveAilment(_ moveAilmentID: Int, completion: @escaping (_ result: Result<PKMMoveAilment, Error>) -> Void) {
        call(endpoint: API.fetchMoveAilmentByID(moveAilmentID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentName: Move Ailment Name
     */
    public func fetchMoveAilment(_ moveAilmentName: String, completion: @escaping (_ result: Result<PKMMoveAilment, Error>) -> Void) {
        call(endpoint: API.fetchMoveAilmentByName(moveAilmentName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Battle Styles list
     */
    public func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveBattleStyle {
        callPaginated(endpoint: API.fetchMoveBattleStyleList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleID: Move Battle Style ID
     */
    public func fetchMoveBattleStyle(_ moveBattleStyleID: Int, completion: @escaping (_ result: Result<PKMMoveBattleStyle, Error>) -> Void) {
        call(endpoint: API.fetchMoveBattleStyleByID(moveBattleStyleID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleName: Move Battle Style Name
     */
    public func fetchMoveBattleStyle(_ moveBattleStyleName: String, completion: @escaping (_ result: Result<PKMMoveBattleStyle, Error>) -> Void) {
        call(endpoint: API.fetchMoveBattleStyleByName(moveBattleStyleName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Categories list
     */
    public func fetchMoveCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveCategory {
        callPaginated(endpoint: API.fetchMoveCategoryList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryID: Move Category ID
     */
    public func fetchMoveCategory(_ moveCategoryID: Int, completion: @escaping (_ result: Result<PKMMoveCategory, Error>) -> Void) {
        call(endpoint: API.fetchMoveCategoryByID(moveCategoryID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryName: Move Category Name
     */
    public func fetchMoveCategory(_ moveCategoryName: String, completion: @escaping (_ result: Result<PKMMoveCategory, Error>) -> Void) {
        call(endpoint: API.fetchMoveCategoryByName(moveCategoryName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Damage Classes list
     */
    public func fetchMoveDamageClassList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveDamageClass {
        callPaginated(endpoint: API.fetchMoveDamageClassList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassID: Move Damage Class ID
     */
    public func fetchMoveDamageClass(_ moveDamageClassID: Int, completion: @escaping (_ result: Result<PKMMoveDamageClass, Error>) -> Void) {
        call(endpoint: API.fetchMoveDamageClassByID(moveDamageClassID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassName: Move Damage Class Name
     */
    public func fetchMoveDamageClass(_ moveDamageClassName: String, completion: @escaping (_ result: Result<PKMMoveDamageClass, Error>) -> Void) {
        call(endpoint: API.fetchMoveDamageClassByName(moveDamageClassName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Learn Methods list
     */
    public func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveLearnMethod {
        callPaginated(endpoint: API.fetchMoveLearnMethodList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodID: Move Learn Method ID
     */
    public func fetchMoveLearnMethod(_ moveLearnMethodID: Int, completion: @escaping (_ result: Result<PKMMoveLearnMethod, Error>) -> Void) {
        call(endpoint: API.fetchMoveLearnMethodByID(moveLearnMethodID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    public func fetchMoveLearnMethod(_ moveLearnMethodName: String, completion: @escaping (_ result: Result<PKMMoveLearnMethod, Error>) -> Void) {
        call(endpoint: API.fetchMoveLearnMethodByName(moveLearnMethodName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Targets list
     */
    public func fetchMoveTargetList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMoveTarget {
        callPaginated(endpoint: API.fetchMoveTargetList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetID: Move Target ID
     */
    public func fetchMoveTarget(_ moveTargetID: Int, completion: @escaping (_ result: Result<PKMMoveTarget, Error>) -> Void) {
        call(endpoint: API.fetchMoveTargetByID(moveTargetID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetName: Move Target Name
     */
    public func fetchMoveTarget(_ moveTargetName: String, completion: @escaping (_ result: Result<PKMMoveTarget, Error>) -> Void) {
        call(endpoint: API.fetchMoveTargetByName(moveTargetName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension MoveService {
    /**
     Fetch Moves list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMove {
        callPaginated(endpoint: API.fetchMoveList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveID: Move ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMove(_ moveID: Int) -> AnyPublisher<PKMMove, Error> {
        call(endpoint: API.fetchMoveByID(moveID))
    }
    
    
    
    /**
     Fetch Move Information
     
     - parameter moveName: Move Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMove(_ moveName: String) -> AnyPublisher<PKMMove, Error> {
        call(endpoint: API.fetchMoveByName(moveName))
    }
    
    
    /**
     Fetch Moves Ailments list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveAilmentList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveAilment {
        callPaginated(endpoint: API.fetchMoveAilmentList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentID: Move Ailment ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveAilment(_ moveAilmentID: Int) -> AnyPublisher<PKMMoveAilment, Error> {
        call(endpoint: API.fetchMoveAilmentByID(moveAilmentID))
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentName: Move Ailment Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveAilment(_ moveAilmentName: String) -> AnyPublisher<PKMMoveAilment, Error> {
        call(endpoint: API.fetchMoveAilmentByName(moveAilmentName))
    }
    
    
    /**
     Fetch Moves Battle Styles list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveBattleStyle {
        callPaginated(endpoint: API.fetchMoveBattleStyleList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleID: Move Battle Style ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveBattleStyle(_ moveBattleStyleID: Int) -> AnyPublisher<PKMMoveBattleStyle, Error> {
        call(endpoint: API.fetchMoveBattleStyleByID(moveBattleStyleID))
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleName: Move Battle Style Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveBattleStyle(_ moveBattleStyleName: String) -> AnyPublisher<PKMMoveBattleStyle, Error> {
        call(endpoint: API.fetchMoveBattleStyleByName(moveBattleStyleName))
    }
    
    
    /**
     Fetch Moves Categories list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveCategory {
        callPaginated(endpoint: API.fetchMoveCategoryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryID: Move Category ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveCategory(_ moveCategoryID: Int) -> AnyPublisher<PKMMoveCategory, Error> {
        call(endpoint: API.fetchMoveCategoryByID(moveCategoryID))
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryName: Move Category Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveCategory(_ moveCategoryName: String) -> AnyPublisher<PKMMoveCategory, Error> {
        call(endpoint: API.fetchMoveCategoryByName(moveCategoryName))
    }
    
    
    /**
     Fetch Moves Damage Classes list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveDamageClassList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveDamageClass {
        callPaginated(endpoint: API.fetchMoveDamageClassList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassID: Move Damage Class ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveDamageClass(_ moveDamageClassID: Int) -> AnyPublisher<PKMMoveDamageClass, Error> {
        call(endpoint: API.fetchMoveDamageClassByID(moveDamageClassID))
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassName: Move Damage Class Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveDamageClass(_ moveDamageClassName: String) -> AnyPublisher<PKMMoveDamageClass, Error> {
        call(endpoint: API.fetchMoveDamageClassByName(moveDamageClassName))
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodID: Move Learn Method ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveLearnMethod {
        callPaginated(endpoint: API.fetchMoveLearnMethodList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveLearnMethod(_ moveLearnMethodID: Int) -> AnyPublisher<PKMMoveLearnMethod, Error> {
        call(endpoint: API.fetchMoveLearnMethodByID(moveLearnMethodID))
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveLearnMethod(_ moveLearnMethodName: String) -> AnyPublisher<PKMMoveLearnMethod, Error> {
        call(endpoint: API.fetchMoveLearnMethodByName(moveLearnMethodName))
    }
    
    
    /**
     Fetch Moves Targets list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveTargetList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMoveTarget {
        callPaginated(endpoint: API.fetchMoveTargetList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetID: Move Target ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveTarget(_ moveTargetID: Int) -> AnyPublisher<PKMMoveTarget, Error> {
        call(endpoint: API.fetchMoveTargetByID(moveTargetID))
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetName: Move Target Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMoveTarget(_ moveTargetName: String) -> AnyPublisher<PKMMoveTarget, Error> {
        call(endpoint: API.fetchMoveTargetByName(moveTargetName))
    }
}



// MARK: - Async Services

extension MoveService {
    /**
     Fetch Moves list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMove {
        try await callPaginated(endpoint: API.fetchMoveList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveID: Move ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMove(_ moveID: Int) async throws -> PKMMove {
        try await PKMMove.decode(from: call(endpoint: API.fetchMoveByID(moveID)))
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveName: Move Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMove(_ moveName: String) async throws -> PKMMove {
        try await PKMMove.decode(from: call(endpoint: API.fetchMoveByName(moveName)))
    }
    
    
    /**
     Fetch Moves Ailments list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveAilmentList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveAilment {
        try await callPaginated(endpoint: API.fetchMoveAilmentList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentID: Move Ailment ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveAilment(_ moveAilmentID: Int) async throws -> PKMMoveAilment {
        try await PKMMoveAilment.decode(from: call(endpoint: API.fetchMoveAilmentByID(moveAilmentID)))
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentName: Move Ailment Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveAilment(_ moveAilmentName: String) async throws -> PKMMoveAilment {
        try await PKMMoveAilment.decode(from: call(endpoint: API.fetchMoveAilmentByName(moveAilmentName)))
    }
    
    
    /**
     Fetch Moves Battle Styles list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveBattleStyle {
        try await callPaginated(endpoint: API.fetchMoveBattleStyleList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleID: Move Battle Style ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveBattleStyle(_ moveBattleStyleID: Int) async throws -> PKMMoveBattleStyle {
        try await PKMMoveBattleStyle.decode(from: call(endpoint: API.fetchMoveBattleStyleByID(moveBattleStyleID)))
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleName: Move Battle Style Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveBattleStyle(_ moveBattleStyleName: String) async throws -> PKMMoveBattleStyle {
        try await PKMMoveBattleStyle.decode(from: call(endpoint: API.fetchMoveByName(moveBattleStyleName)))
    }
    
    
    /**
     Fetch Moves Categories list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveCategoryList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveCategory {
        try await callPaginated(endpoint: API.fetchMoveCategoryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryID: Move Category ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveCategory(_ moveCategoryID: Int) async throws -> PKMMoveCategory {
        try await PKMMoveCategory.decode(from: call(endpoint: API.fetchMoveCategoryByID(moveCategoryID)))
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryName: Move Category Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveCategory(_ moveCategoryName: String) async throws -> PKMMoveCategory {
        try await PKMMoveCategory.decode(from: call(endpoint: API.fetchMoveCategoryByName(moveCategoryName)))
    }
    
    
    /**
     Fetch Moves Damage Classes list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveDamageClassList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveDamageClass {
        try await callPaginated(endpoint: API.fetchMoveDamageClassList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassID: Move Damage Class ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveDamageClass(_ moveDamageClassID: Int) async throws -> PKMMoveDamageClass {
        try await PKMMoveDamageClass.decode(from: call(endpoint: API.fetchMoveDamageClassByID(moveDamageClassID)))
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassName: Move Damage Class Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveDamageClass(_ moveDamageClassName: String) async throws -> PKMMoveDamageClass {
        try await PKMMoveDamageClass.decode(from: call(endpoint: API.fetchMoveDamageClassByName(moveDamageClassName)))
    }
    
    
    /**
     Fetch Moves Learn Methods list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveLearnMethod {
        try await callPaginated(endpoint: API.fetchMoveLearnMethodList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodID: Move Learn Method ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveLearnMethod(_ moveLearnMethodID: Int) async throws -> PKMMoveLearnMethod {
        try await PKMMoveLearnMethod.decode(from: call(endpoint: API.fetchMoveLearnMethodByID(moveLearnMethodID)))
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveLearnMethod(_ moveLearnMethodName: String) async throws -> PKMMoveLearnMethod {
        try await PKMMoveLearnMethod.decode(from: call(endpoint: API.fetchMoveLearnMethodByName(moveLearnMethodName)))
    }
    
    
    /**
     Fetch Moves Targets list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveTargetList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMoveTarget {
        try await callPaginated(endpoint: API.fetchMoveTargetList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetID: Move Target ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveTarget(_ moveTargetID: Int) async throws -> PKMMoveTarget {
        try await PKMMoveTarget.decode(from: call(endpoint: API.fetchMoveTargetByID(moveTargetID)))
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetName: Move Target Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMoveTarget(_ moveTargetName: String) async throws -> PKMMoveTarget {
        try await PKMMoveTarget.decode(from: call(endpoint: API.fetchMoveTargetByName(moveTargetName)))
    }
}
