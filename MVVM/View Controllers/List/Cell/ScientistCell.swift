//
//  ScientistCell.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import UIKit

class ScientistCell: UITableViewCell {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var country: UILabel!
  @IBOutlet weak var field: UILabel!
  @IBOutlet weak var picture: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  func configure(model: ScientistViewModel) {
    self.name.text = model.name
    self.country.text = model.citizenship
    self.field.text = model.field
    self.picture.image = UIImage(named: model.image)
  }

}
