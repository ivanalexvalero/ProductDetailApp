//
//
//  OnboardingViewController.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var nextButton: PrincipalButton!
    @IBOutlet weak private var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle(Constants.startButtonTitle, for: .normal)
                nextButton.backgroundColor = UIColor(named: Constants.Colors.darkBlue)
            } else {
                nextButton.setTitle(Constants.nextButtonTitle, for: .normal)
                nextButton.backgroundColor = UIColor(named: Constants.Colors.purple)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = true
        nextButton.setTitle(Constants.nextButtonTitle, for: .normal)
        slides = [
            OnboardingSlide(title: Constants.firstSlideTitle, description: Constants.firstSlideDescription, image: UIImage(named: Constants.firstSlideImage)),
            OnboardingSlide(title: Constants.secondSlideTitle, description: Constants.secondSlideDescription, image: UIImage(named: Constants.secondSlideImage)),
            OnboardingSlide(title: Constants.thirdSlideTitle, description: Constants.thirdSlideDescription, image: UIImage(named: Constants.thirdSlideImage))
        ]
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }

    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.verticalSizeClass == .compact {
//            collectionView.collectionViewLayout.invalidateLayout()
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal  // O .vertical según tus necesidades
            collectionView.collectionViewLayout = layout

        } else {
            // Diseño para otros modos
        }
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: Constants.homeNavigationController) as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isLandscape = UIDevice.current.orientation.isLandscape

//        if isLandscape {
            // Ajustar el margen superior para landscape y definir el tamaño de la celda
//            let cellWidth: CGFloat = 400.0  // Ajusta según tus necesidades
//            let cellHeight: CGFloat = 200.0  // Ajusta según tus necesidades
//
//            return CGSize(width: cellWidth, height: cellHeight)
//        } else {
            // Otro tamaño para otras orientaciones (por ejemplo, portrait)
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }

}
