//
//  InterfaceAssemble.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

final class InterfaceAssemble {
    
    func provideLaunchScreenViewController () -> LaunchScreenViewController {
        return InterfaceBuilder().launchScreenViewController()
    }
    
    func provideFilmsViewController () -> FilmsViewController {
        let viewModel = FilmsViewModel(filmService: MasterService.instance.getFilmService())
        return InterfaceBuilder().filmsViewController(viewModel: viewModel)
    }
    
    //MARK: Test Support
    
    func provideMockFilmsViewController () -> FilmsViewController {
        let viewModel = FilmsViewModel(filmService: FilmService.mockInstance)
        return InterfaceBuilder().filmsViewController(viewModel: viewModel)
    }
}
