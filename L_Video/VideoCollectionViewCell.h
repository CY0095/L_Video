//
//  VideoCollectionViewCell.h
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#define VideoCollectionViewCell_Identify @"VideoCollectionViewCell_Identify"

@class VideoCollectionViewCell;

@protocol VideoCollectionViewCellDelegate<NSObject>

- (void)videoCollectionViewPlayBtnCliked:(VideoCollectionViewCell *)cell;

@end

@interface VideoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImage;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *length;

@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (nonatomic, assign) id<VideoCollectionViewCellDelegate>delegate;

@property (nonatomic, assign) int type;

@property (nonatomic, strong) VideoModel *videoModel;


@end
