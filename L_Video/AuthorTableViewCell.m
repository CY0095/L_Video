//
//  AuthorTableViewCell.m
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "AuthorTableViewCell.h"

@implementation AuthorTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.hander.layer.masksToBounds = YES;
    self.hander.layer.cornerRadius = self.hander.bounds.size.width / 2.0;
    
}


- (void)setAuthorModel:(AuthorModel *)authorModel {
    
    _authorModel = authorModel;
    [self.hander setImageWithURL:[NSURL URLWithString:authorModel.icon] placeholderImage:[UIImage imageNamed:@"mine1"]];
    self.name.text = authorModel.name;
    self.DateLabel.text = authorModel.detail;
    self.range.text = [NSString stringWithFormat:@"排名:%@",authorModel.pop];
    
}













- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
