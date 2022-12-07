//
//  DetailViewController.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/2/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
   
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
                
            case .detailHeader: return LayoutSectionFactory.detailHeader()
            case .color: return LayoutSectionFactory.color()
//            case .size: return LayoutSectionFactory.size()
//            case .description: return LayoutSectionFactory.description()
//            case .button: return LayoutSectionFactory.button()
//
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
            .nib(DetailHeaderCell.self),
            .nib(ColorCell.self),
//            .nib(SizeCell.self),
//            .nib(ButtonCell.self),
//            .nib(DescriptionCell.self)
        ]
        
        detailCollectionView.register(cells: cells)
        detailCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: detailCollectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .detailHeader: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderCell", for: indexPath)
                return cell
            case .color: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
                return cell
//            case .size:
//            case .description:
//            case .button:
            default: return nil
            }
        }
        let sections = [
            Section(type: .detailHeader, items: [
            Item()
            ]),
            Section(type: .color, items: [
            Item()
            ])
        ]
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
