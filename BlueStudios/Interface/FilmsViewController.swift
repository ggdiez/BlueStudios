//
//  FilmsViewController.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import UIKit


final class FilmsViewController: UIViewController {
    
    var films: [Film] = []
    let heightFilmCell: CGFloat = 151.0
    fileprivate let filmCellIdentifier: String = "FilmCellIdentifier"
    fileprivate let filmCellName: String = "FilmCell"
    
    @IBOutlet weak var filmsTitle: UILabel!
    @IBOutlet weak var filmTableView: UITableView!
    
    private var viewModel: FilmsViewModel!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: FilmsViewModel) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil )
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accesibilityLabels()
        configureTableView()
        bindModelView()
        viewModel.loadFilms()
    }
    
    private func accesibilityLabels () {
        view.accessibilityLabel = AccessibilityLabels.FilmsView.filmsView
        filmsTitle.accessibilityLabel = AccessibilityLabels.FilmsView.filmsTitle
        filmTableView.accessibilityLabel = AccessibilityLabels.FilmsView.filmsTableView
    }
    
    private func configureTableView () {
        filmTableView.register(UINib(nibName: filmCellName, bundle: nil), forCellReuseIdentifier: filmCellIdentifier)
    }
    
    //MARK: Binding
    func bindModelView() {
        viewModel.didFilmsLoaded = {(films) -> () in
           self.filmsLoaded(films: films)
        }
    }
    
    func filmsLoaded (films : [Film]) {
         self.films = films
         self.filmTableView.reloadData()
    }
}

extension FilmsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightFilmCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: filmCellIdentifier) as! FilmCell
        cell.name.text = films[indexPath.row].name
        cell.date.text = films[indexPath.row].date
        cell.status.text = films[indexPath.row].getStatus().string()
        cell.status.textColor = films[indexPath.row].getStatus().color()
        return cell
    }
}

extension FilmsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let filmSelected = films[indexPath.row]
        showStatusOptions(filmId: filmSelected._id, currentStatus: filmSelected.getStatus())
    }
}

extension FilmsViewController {
    
    func showStatusOptions (filmId: String, currentStatus: FilmStatus) {
    
        let currentOptions = FilmStatus.allCases.filter{$0 != currentStatus}
        
        let actionController = UIAlertController(title: "Opciones", message: "Selecciona nuevo status", preferredStyle: .actionSheet)
        actionController.accessibilityLabel = AccessibilityLabels.FilmsView.FilmStatusActionSheet.view
        
        for option in currentOptions {
            let action = UIAlertAction(title: option.string(), style: .default) { (action) in
                self.viewModel.changeFilmStatus(filmId: filmId, filmStatus: option)
            }
            actionController.addAction(action)
        }
        
        if actionController.actions.count == 2 {
            actionController.actions.first!.accessibilityLabel = AccessibilityLabels.FilmsView.FilmStatusActionSheet.option1
            actionController.actions.last!.accessibilityLabel = AccessibilityLabels.FilmsView.FilmStatusActionSheet.option2
        }
        
        present(actionController, animated: false, completion: nil)
    }
}

