//
//  AuthorTableViewCell.h
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorModel.h"
#define AuthorTableViewCell_Identify @"AuthorTableViewCell_Identify"

@interface AuthorTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *hander;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *range;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (nonatomic, strong) AuthorModel *authorModel;

@end
