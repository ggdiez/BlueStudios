//
//  FilmsViewUITestCases.swift
//  BlueStudiosTests
//
//  Created by Gonzalo Gonzalez  on 10/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import XCTest
import KIF
import Nimble
import UIKit
@testable import BlueStudios

class  FilmsViewUITestCases: AcceptanceTestCase {
    
    let delay = 0.5
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAvatarViewWithAllTheFields () {
       delayWithSeconds(delay) {
            self.showFilmsView()
        }
        
        self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.filmsView)
        self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.filmsTitle)
        self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.filmsTableView)
    }
    
    func testFilmsViewMustHavePropertyFilmsCollection () {
        let expectedNumberOfFilms: Int = 6
        
        delayWithSeconds(delay) {
            self.showFilmsView()
        }
        
        let tableView: UITableView = self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.filmsTableView) as! UITableView
        
        let returnedFilms = tableView.numberOfRows(inSection: 0)
        
        expect(returnedFilms).toEventually(equal(expectedNumberOfFilms))
    }
    
    func testFilmsViewChangeStatusInFirstRow () {
        let expectedFilmStatus = "Filming"
        
        delayWithSeconds(delay) {
            self.showFilmsView()
        }
        
        let tableView: UITableView = self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.filmsTableView) as! UITableView
        
        self.tester().tapRow(at: IndexPath(row: 0, section: 0), in: tableView)
        
        self.tester().waitForView(withAccessibilityLabel: AccessibilityLabels.FilmsView.FilmStatusActionSheet.option1)
        
        self.tester().tapView(withAccessibilityLabel: AccessibilityLabels.FilmsView.FilmStatusActionSheet.option1)
        
        let updatedRow1: FilmCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! FilmCell
        
        expect(updatedRow1.status.text).toEventually(equal(expectedFilmStatus))
    }
    
    fileprivate func showFilmsView () {
        let viewController = InterfaceAssemble().provideMockFilmsViewController()
        present(viewController: viewController as UIViewController)
        tester().waitForAnimationsToFinish()
    }
}
