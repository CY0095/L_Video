//
//  VideoCollectionViewCell.m
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideoCollectionViewCell.h"

@implementation VideoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setVideoModel:(VideoModel *)videoModel {
    
    _videoModel = videoModel;
    [_BackgroundImage setImageWithURL:[NSURL URLWithString:videoModel.thumb] placeholderImage:nil];
    _length.text = [NSString stringWithFormat:@"%@",videoModel.time];
    _date.text = videoModel.date;
    _title.text = videoModel.title;
    
}


- (void)setType:(int)type {
    
    _type = type;
    if (_type == 1) {
        _playBtn.hidden = NO;
    }else {
        _playBtn.hidden = YES;
    }
    
}
- (IBAction)playBtnClicked:(id)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(videoCollectionViewPlayBtnCliked:)]) {
        [_delegate videoCollectionViewPlayBtnCliked:self];
    }
    
}


@end
