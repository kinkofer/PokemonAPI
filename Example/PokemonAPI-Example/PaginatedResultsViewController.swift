//
//  PaginatedResultsViewController.swift
//  PokemonAPI-Example
//
//  Created by Christopher Jennewein on 6/30/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit
import PokemonAPI


class PaginatedResultsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var lastBtn: UIButton!
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pageBtn: UIButton!
    
    /// The current pagedObject returned from the paginated web service call.
    var pagedObject: PKMPagedObject<PKMPokemon>? {
        didSet {
            if let pagedObject = pagedObject {
                DispatchQueue.main.async {
                    self.firstBtn.isEnabled = pagedObject.hasPrevious
                    self.lastBtn.isEnabled = pagedObject.hasNext
                    self.prevBtn.isEnabled = pagedObject.hasPrevious
                    self.nextBtn.isEnabled = pagedObject.hasNext
                    
                    self.pageBtn.isEnabled = pagedObject.pages > 1
                    self.pageBtn.setTitle("Page \(pagedObject.currentPage + 1)", for: .normal)
                }
            }
        }
    }
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemon()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        firstBtn.isEnabled = false
        lastBtn.isEnabled = false
        prevBtn.isEnabled = false
        nextBtn.isEnabled = false
        pageBtn.isEnabled = false
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func goFirst(_ sender: Any) {
        if let pagedObject = pagedObject {
            fetchPokemon(paginationState: .continuing(pagedObject, .first))
        }
    }
    
    @IBAction func goLast(_ sender: Any) {
        if let pagedObject = pagedObject {
            fetchPokemon(paginationState: .continuing(pagedObject, .last))
        }
    }
    
    @IBAction func goPrevious(_ sender: Any) {
        if let pagedObject = pagedObject {
            fetchPokemon(paginationState: .continuing(pagedObject, .previous))
        }
    }
    
    @IBAction func goNext(_ sender: Any) {
        if let pagedObject = pagedObject {
            fetchPokemon(paginationState: .continuing(pagedObject, .next))
        }
    }
    
    
    /// Presents a modal or popover to list the pages the user can select. The selected page index is passed in PageSelectDelegate.didSelectPageIndex(_:).
    @IBAction func showPages(_ sender: Any) {
        guard let pagedObject = pagedObject else {
            return
        }
        
        let pageVC = PageTableViewController()
        pageVC.pageCount = pagedObject.pages
        pageVC.delegate = self
        
        pageVC.modalPresentationStyle = .popover
        pageVC.preferredContentSize = CGSize(width: 100, height: 400)
        
        if let popover = pageVC.popoverPresentationController {
            popover.delegate = self
            popover.permittedArrowDirections = .up
            
            if let button = sender as? UIButton {
                popover.sourceView = button
                popover.sourceRect = button.bounds
            }
            
            self.present(pageVC, animated: true)
        }
    }
    
    
    
    // MARK: - Data
    
    func fetchPokemon(paginationState: PaginationState<PKMPokemon> = .initial(pageLimit: 20)) {
        PokemonAPI.pokemonService.fetchPokemonList(paginationState: paginationState) { result in
            switch result {
            case .success(let pagedObject):
                self.pagedObject = pagedObject
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.message)
            }
        }
    }
}



// MARK: - UITableViewDataSource

extension PaginatedResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pagedObject?.results?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        if let pokemon = pagedObject?.results?[indexPath.row] as? PKMNamedAPIResource {
            cell.textLabel?.text = pokemon.name
        }
        
        return cell
    }
}



// MARK: - UITableViewDelegate

extension PaginatedResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



// MARK: - PageSelectDelegate

extension PaginatedResultsViewController:  PageSelectDelegate {
    func didSelectPageIndex(_ pageIndex: Int) {
        if let pagedObject = pagedObject {
            fetchPokemon(paginationState: .continuing(pagedObject, .page(pageIndex)))
        }
    }
}



// MARK: - UIPopoverPresentationControllerDelegate

extension PaginatedResultsViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
