//
//  ViewController.swift
//  Coppy_Rabbit
//
//  Created by 王昱淇 on 2022/8/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var rabbitLabel: UILabel!
    @IBOutlet var rabbitEyeLabel: UILabel!
    @IBOutlet var rabbitHandLabel: UILabel!
    
    var imageArray = ["87_Points_250x250", "Blue-and-whie_Slippers_250x250", "Bopomofo_250x250", "Bubble_Tea_250x250", "Cheongsam_250x250", "Easycard_250x250", "Foot_Massage_250x250", "Mango_Shaved_Ice_250x250", "Map_of_Taiwan_250x250", "Minced_Pork_Rice_250x250", "Night_Market_250x250", "NTD_250x250", "Pineapple_Cake_250x250", "Rainbow_Heart_250x250", "Spring_Couplet_250x250", "Stinky_Tofu_250x250", "Taipei_101_250x250", "Taiwan_Beer_250x250", "Taiwanese_Temple_250x250", "Tatung_s_Rice_cooker_250x250", "Three-section_Compound_250x250", "Traditional_Chinese_250x250", "Tricolor_Bag_250x250", "Xiaolongbao_250x250"]
    
    var content = NSMutableAttributedString(string: "/>")
    var attachment = NSTextAttachment()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "複製這隻兔子，不過要換掉他手上的東西"
        titleLabel.textColor = .white
        
        contentLabel.text = "往左往右滑換掉兔子手上的東西"
        
        rabbitLabel.textColor = .white
        rabbitEyeLabel.textColor = .white
        rabbitLabel.text = "(\\_/)"
        rabbitEyeLabel.text = "( •_•)"
        
        attachment.image = UIImage(named: imageArray[index])
        attachment.bounds = CGRect(x: 0, y: -18, width: 58, height: 58)
        
        content.append(NSMutableAttributedString(attachment: attachment))
        content.append(NSMutableAttributedString(string: " >"))
        
        rabbitHandLabel.attributedText = content
     
    }
    
    @IBAction func changeContent(_ sender: UISwipeGestureRecognizer) {
    
        if sender.direction == .left {
            if index == 0 {
                index = imageArray.count - 1
            } else {
                index = index - 1
            }
        }
        
        if sender.direction == .right {
            if index == imageArray.count - 1 {
                index = 0
            } else {
                index = index + 1
            }
        }

        attachment.image = UIImage(named: imageArray[index])
        attachment.bounds = CGRect(x: 0, y: -18, width: 58, height: 58)

        content.append(NSMutableAttributedString(attachment: attachment))
        rabbitHandLabel.attributedText = content
        content.deleteCharacters(in: NSRange(location: 5, length: 1))
        rabbitHandLabel.attributedText = content
    }
    
    
}
    
    
    

    
    



