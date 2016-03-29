//
//  CardCell.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/29.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    static let height : CGFloat = 70.0
    private var suitLabel: UILabel!
    private var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        rankLabel = UILabel()
        rankLabel.backgroundColor = UIColor.clearColor()
        rankLabel.textAlignment = .Center
        rankLabel.font = UIFont.boldSystemFontOfSize(30)
        self.contentView.addSubview(rankLabel)
        
        suitLabel = UILabel()
        suitLabel.backgroundColor = UIColor.clearColor()
        suitLabel.textAlignment = .Center
        suitLabel.font = UIFont.boldSystemFontOfSize(30)
        self.contentView.addSubview(suitLabel)
    }
    
    func fillWith(card: Card) {
        rankLabel.textColor = card.color
        rankLabel.text = card.rank.description
        suitLabel.text = card.suit.description
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rankLabel.frame = CGRectMake((contentView.frame.width / 2) - 70, 0, 70, CardCell.height)
        suitLabel.frame = CGRectMake((contentView.frame.width / 2), 0, 70, CardCell.height)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
