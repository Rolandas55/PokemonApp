//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by kraujalis.rolandas on 07/11/2023.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokeyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var supertypeLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    
    let pokName = UILabel()
    let pokType = UILabel()
    let pokDexNumber = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //setupView()
    }
    
    func setupView() {
        pokName.translatesAutoresizingMaskIntoConstraints = false
        pokType.translatesAutoresizingMaskIntoConstraints = false
        pokDexNumber.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pokName)
        contentView.addSubview(pokType)
        contentView.addSubview(pokDexNumber)
        
        pokName.textColor = UIColor.label
        pokType.textColor = UIColor.label
        pokDexNumber.textColor = UIColor.label
        pokName.font = UIFont(name: "GillSans", size: 16)
        pokType.font = UIFont(name: "GillSans", size: 16)
        pokDexNumber.font = UIFont(name: "GillSans", size: 16)
        
        pokName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        pokName.topAnchor.constraint(equalTo: self.topAnchor, constant: 30) .isActive = true
        
        pokType.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        pokType.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        pokDexNumber.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        pokDexNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(withDataFrom: Card) {
        nameLabel.text = "Name: " + withDataFrom.name
        hpLabel.text = "Health points: " + (withDataFrom.hp ?? "0")
        supertypeLabel.text = (withDataFrom.supertype ?? "")
        pokeyImageView.sd_setImage(with: URL(string: withDataFrom.imageURL))
    }

}
