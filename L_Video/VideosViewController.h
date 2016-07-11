//
//  VideosViewController.h
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "BaseViewController.h"

@interface VideosViewController : BaseViewController

@property (nonatomic, copy) NSString *authorID;
// 判断是从dota主播界面进来还是LOL主播界面进来
@property (nonatomic, assign) int sourceFrom;

@end
