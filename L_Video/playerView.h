//
//  playerView.h
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <UIKit/UIKit.h>
// 引入视频播放器框架
#import <AVFoundation/AVFoundation.h>

@interface playerView : UIView

typedef NS_ENUM(NSInteger, ERVideoLayerStyle) {
    ERVideoTop,
    ERVideoLowerLeftCorner,
    ERVideoLowerRightCorner,
    ERVideoRightUpperRightCorner,
    ERVideoRightUpperLeftCorner
};

/** 播放管理者 */
@property (nonatomic, strong) AVPlayerItem *playerItem;
/** 播放器 */
@property (nonatomic, strong) AVPlayer *player;
/** playerLayer */
@property (nonatomic, strong) AVPlayerLayer *playerLayer;




- (id)initWithUrl:(NSString *)url frame:(CGRect)frame;

/** 视屏样式 */
@property (nonatomic, assign) ERVideoLayerStyle videoLayerStyle;

@end
