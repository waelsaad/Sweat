//
//  ProgramTableViewCell.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

final class ProgramTableViewCell: UITableViewCell, ViewWithNib, Reusable {
    
    // MARK: - Lifecycle
    
    @IBOutlet weak var weightLosssProgressBarStackView: UIStackView!
    @IBOutlet weak var strengthProgressBarStackView: UIStackView!
    @IBOutlet weak var muscleProgressBarStackView: UIStackView!
    @IBOutlet weak var flexibilityProgressBarStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var trainerLabel: UILabel!
    
    @IBOutlet private weak var tagsCollectionView: TagsCollectionView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightProgressView: UIProgressView!
    
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var muscleProgressView: UIProgressView!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var strengthProgressView: UIProgressView!
    
    @IBOutlet weak var flexibilityLabel: UILabel!
    @IBOutlet weak var flexibilityProgressView: UIProgressView!

    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = UIColor.clear
            containerView.layer.shadowOpacity = Constants.shadowOpacity
            containerView.layer.shadowRadius = Constants.shadowRadius
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
    
    @IBOutlet weak var clippingView: UIView! {
        didSet {
            clippingView.layer.masksToBounds = true
            clippingView.layer.cornerRadius = Constants.radius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Configure View
    
    override func layoutSubviews() {
        
        weightProgressView.clipsToBounds = true
        muscleProgressView.clipsToBounds = true
        strengthProgressView.clipsToBounds = true
        flexibilityProgressView.clipsToBounds = true
        
        weightProgressView.layer.cornerRadius = Constants.radius
        muscleProgressView.layer.cornerRadius = Constants.radius
        strengthProgressView.layer.cornerRadius = Constants.radius
        flexibilityProgressView.layer.cornerRadius = Constants.radius
        
        weightProgressView.transform = CGAffineTransform(scaleX: Constants.progressViewWidth, y: Constants.progressViewHeight)
        muscleProgressView.transform = CGAffineTransform(scaleX: Constants.progressViewWidth, y: Constants.progressViewHeight)
        strengthProgressView.transform = CGAffineTransform(scaleX: Constants.progressViewWidth, y: Constants.progressViewHeight)
        flexibilityProgressView.transform = CGAffineTransform(scaleX: Constants.progressViewWidth, y: Constants.progressViewHeight)
    }
    
    func configure(with program: Program) {
        
        titleLabel.text = program.name
        
        if let url = program.trainer?.image_url {
            heroImageView.load(url: url)
        }
        
        guard let trainerName = program.trainer?.name else { return }
        
        trainerLabel.text = "PROGRAM.TRAINER.PREFIX".localized + trainerName
        
        let weightLoss = program.attributes?.filter { $0.attributeType == .weightLoss }.first
        let muscle = program.attributes?.filter { $0.attributeType == .muscle }.first
        let strength = program.attributes?.filter { $0.attributeType == .strength }.first
        let flexibility = program.attributes?.filter { $0.attributeType == .fitness }.first
        
        
        if let weightAttribute = weightLoss, let value = weightAttribute.value {
            setWeightLossVisibility(isHidden: false)
            weightLabel.text = weightAttribute.name
            weightProgressView.progress = Float((value as NSString).floatValue) / Constants.progressBarMaximumValue
        } else {
            setWeightLossVisibility(isHidden: true)
        }
        
        if let muscleAttribute = muscle, let value = muscleAttribute.value {
            setMuscleVisibility(isHidden: false)
            muscleLabel.text = muscleAttribute.name
            muscleProgressView.progress = Float((value as NSString).floatValue) / Constants.progressBarMaximumValue
        } else {
            setMuscleVisibility(isHidden: true)
        }
        
        if let strengthAttribute = strength, let value = strengthAttribute.value {
            setStrengthVisibility(isHidden: false)
            strengthLabel.text = strengthAttribute.name
            strengthProgressView.progress = Float((value as NSString).floatValue) / Constants.progressBarMaximumValue
        } else {
            setStrengthVisibility(isHidden: true)
        }
        
        if let flexibilityAttribute = flexibility, let value = flexibilityAttribute.value {
            setFlexibilityVisibility(isHidden: false)
            flexibilityLabel.text = flexibilityAttribute.name
            flexibilityProgressView.progress = Float((value as NSString).floatValue) / Constants.progressBarMaximumValue
        } else {
            setFlexibilityVisibility(isHidden: true)
        }
        
        guard let tags = program.tags else { return }
        tagsCollectionView.reload(with: tags.map { TagsCollectionViewDisplayModel(name: $0.name) })
    }
    
    func setWeightLossVisibility (isHidden: Bool) {
        weightLabel.isHidden = isHidden
        weightLosssProgressBarStackView.isHidden = isHidden
    }
    
    func setMuscleVisibility (isHidden: Bool) {
        muscleLabel.isHidden = isHidden
        muscleProgressBarStackView.isHidden = isHidden
    }
    
    func setStrengthVisibility (isHidden: Bool) {
        strengthLabel.isHidden = isHidden
        strengthProgressBarStackView.isHidden = isHidden
    }
    
    func setFlexibilityVisibility (isHidden: Bool) {
        flexibilityLabel.isHidden = isHidden
        flexibilityProgressBarStackView.isHidden = isHidden
    }
}

extension ProgramTableViewCell {
    struct Constants {
        static let radius: CGFloat = 5
        static let progressViewWidth: CGFloat = 1.2
        static let progressViewHeight: CGFloat = 4
        static let progressBarMaximumValue: Float = 5
        static let shadowOpacity: Float = 0.5
        static let shadowRadius: CGFloat = 3
    }
}
