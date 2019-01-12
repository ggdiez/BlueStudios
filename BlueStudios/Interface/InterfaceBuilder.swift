//
//  InterfaceBuilder.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

final class InterfaceBuilder {
    
    func launchScreenViewController () -> LaunchScreenViewController {
        return LaunchScreenViewController(nibName: "LaunchScreenView", bundle: nil)
    }
    
    func filmsViewController (viewModel: FilmsViewModel) -> FilmsViewController {
        return FilmsViewController(nibName: "FilmsView", bundle: nil, viewModel: viewModel)
    }
}
