//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by kraujalis.rolandas on 09/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon: Card?
    var id = UILabel()
    var name = UILabel()
    var nationalPokedexNumber = UILabel()
    var imageURL = UILabel()
    var imageURLHiRes = UILabel()
    var types = UILabel()
    var supertype = UILabel()
    var subtype = UILabel()
    var evolvesFrom = UILabel()
    var hp = UILabel()
    var number = UILabel()
    var artist = UILabel()
    var series = UILabel()
    var cardSet = UILabel()
    var setCode = UILabel()
    var attacks = UILabel()
    var weaknesses = UILabel()
    var retreatCost = UILabel()
    var convertedRetreatCost = UILabel()
    var resistances = UILabel()
    var text = UILabel()
    var ability = UILabel()
    var image =  UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarView()
        setupView()
        updateValues()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBarView() {
        title = pokemon?.name
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    func setupView() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        
        let uiLabels = [id, name, nationalPokedexNumber, imageURL, imageURLHiRes, types, supertype, subtype, evolvesFrom, hp, number, artist, series, cardSet, setCode, attacks, weaknesses, retreatCost, convertedRetreatCost, resistances, text, ability]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 8),
        ])
        
        scrollView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        for i in uiLabels {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.textAlignment = .left
            i.numberOfLines = 0
            i.textColor = UIColor.label
            i.font = UIFont(name: "GillSans", size: 14)
            stackView.addArrangedSubview(i)
        }
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            image.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 600),
            image.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
    func updateValues() {
        id.text = "Id: \(pokemon?.id ?? "-")"
        name.text = "Name: \(pokemon?.name ?? "-")"
        if let dexNum = pokemon?.nationalPokedexNumber {
            nationalPokedexNumber.text = "National pokedex number:  \(String(dexNum))"
        } else {
            nationalPokedexNumber.text = "National pokedex number: -"
        }
        imageURL.text = "Image URL: \(pokemon?.imageURL ?? "-")"
        imageURLHiRes.text = "Image URL high resolution: rpokemon?.imageURLHiRes"
        types.text = "Types: "
        if let pTypes = pokemon?.types {
            types.text?.append(pTypes.joined(separator: ", "))
        }
        supertype.text = "Supertype: \(pokemon?.supertype ?? "-")"
        subtype.text = "Subtype: \(pokemon?.subtype ?? "-")"
        evolvesFrom.text = "Evolves from: \(pokemon?.evolvesFrom ?? "-")"
        if let hp = pokemon?.hp {
            nationalPokedexNumber.text = "HP:  \(String(hp))"
        } else {
            nationalPokedexNumber.text = "HP: -"
        }
        number.text = "Number: \(pokemon?.number ?? "-")"
        artist.text = "Artist: \(pokemon?.artist ?? "-")"
        series.text = "Series: \(pokemon?.series?.rawValue ?? "-")"
        cardSet.text = "Card series: \(pokemon?.cardSet ?? "-")"
        setCode.text = "Set code: \(pokemon?.setCode ?? "-")"
        attacks.text = "Attacks: "
        if let pAttacks = pokemon?.attacks {
            for (i, elm) in pAttacks.enumerated() {
                attacks.text?.append("\n\tcost: ")
                if let att = elm.cost {
                    for (i, elm) in att.enumerated() {
                        attacks.text?.append(elm.rawValue)
                        if i != att.endIndex - 1 {
                            attacks.text?.append(", ")
                        }
                    }
                }
                attacks.text?.append("\n\tname: ")
                if let att = elm.name {
                        attacks.text?.append(att)
                }
                attacks.text?.append("\n\ttext: ")
                if let att = elm.text {
                    attacks.text?.append(att)
                }
                attacks.text?.append("\n\tdamage: ")
                if let att = elm.damage {
                        attacks.text?.append(att)
                }
                attacks.text?.append("\n\tconverted energy cost: ")
                if let att = elm.convertedEnergyCost {
                    attacks.text?.append(String(att))
                }
                if i != pAttacks.endIndex - 1 {
                    attacks.text?.append("\n")
                }
            }
        }
        weaknesses.text = "Weaknesses: "
        if let pWeakness = pokemon?.weaknesses {
            for (i, elm) in pWeakness.enumerated() {
                weaknesses.text?.append("\n\ttype: ")
                if let weak = elm.type {
                    weaknesses.text?.append(weak.rawValue)
                }
                weaknesses.text?.append("\n\tvalue: ")
                if let weak = elm.value {
                    weaknesses.text?.append(weak)
                }
                if i != pWeakness.endIndex - 1 {
                    weaknesses.text?.append("\n")
                }
            }
        }
        retreatCost.text = "Retrear cost: "
        if let rCost = pokemon?.retreatCost {
            for (i, elm) in rCost.enumerated() {
                retreatCost.text?.append(elm.rawValue)
                if i != rCost.endIndex - 1 {
                    retreatCost.text?.append(", ")
                }
            }
        } else {
            retreatCost.text?.append("-")
        }
        if let convRC = pokemon?.convertedRetreatCost {
            convertedRetreatCost.text = "Converted retreat cost: \(String(convRC))"
        } else {
            convertedRetreatCost.text = "Converted retreat cost: -"
        }
        resistances.text = "Resistances: "
        if let res = pokemon?.resistances {
            for (i, elm) in res.enumerated() {
                resistances.text?.append("\n\ttype: ")
                if let elm = elm.type {
                    resistances.text?.append(elm.rawValue)
                }
                resistances.text?.append("\n\tvalue: ")
                if let elm = elm.value {
                    resistances.text?.append(elm)
                }
                if i != res.endIndex - 1 {
                    resistances.text?.append("\n")
                }
            }
        } else {
            retreatCost.text?.append("-")
        }
        text.text = "Text: "
        if let txt = pokemon?.text {
            for (i, elm) in txt.enumerated() {
                text.text?.append(elm)
                if i != txt.endIndex - 1 {
                    text.text?.append(", ")
                }
            }
        }
        ability.text = "Ability:"
        if let ab = pokemon?.ability {
            ability.text?.append("\n\tname: \(ab.name ?? "-")")
            ability.text?.append("\n\ttext: \(ab.text ?? "-")")
            ability.text?.append("\n\ttype: \(ab.type?.rawValue ?? "-")")
        }
        if let poke = pokemon {
            image.sd_setImage(with: URL(string: poke.imageURL))
        }
     }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
