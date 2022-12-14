//
//  ViewController.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 11/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout  = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header: return LayoutSectionFactory.header()
            case .category: return LayoutSectionFactory.category()
            case .selection: return LayoutSectionFactory.selection()
            default: return nil
            }
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       initialize()
    }
    
    func initialize() {
        setupCollectionView()
        configureDataSource()
    }
    
    private func setupCollectionView() {
        
        let cells: [RegisterableView] = [
            .nib(HeaderCell.self),
            .nib(CategoryCell.self),
            .nib(SelectionCell.self)
        ]
        collectionView.delegate = self
        collectionView.register(cells: cells)
        collectionView.collectionViewLayout = collectionViewLayout
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
                
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
                return cell
                
            case .category:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
                return cell
                
            case .selection:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCell", for: indexPath)
                return cell
            default: return nil
            }
        }
        let sections = [
            Section(type: .header, items: [
            Item()
            ]),
             Section(type: .category, items: [
            Item(), Item(), Item(), Item()
            ]),
            Section(type: .selection, items: [
            Item(), Item()
            ]),
            Section(type: .selection, items: [
            Item(), Item()
            ])
        ]
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
                         dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
