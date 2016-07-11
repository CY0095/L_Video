//
//  VideoDetailModel.h
//  L_Video
//
//  Created by lanou3g on 16/7/9.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "BaseModel.h"

@interface VideoDetailModel : BaseModel

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *message;
// 视频播放地址
@property (nonatomic, copy) NSString *url;

@end
