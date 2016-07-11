//
//  VideoDetailRequest.h
//  L_Video
//
//  Created by lanou3g on 16/7/9.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoDetailRequest : NSObject

+ (instancetype)shareVideoDetailRequest;

- (void)requestSingleDotaVideoWithVideoID:(NSString *)ID success:(SuccessResponce)success failure:(FailureResponce)failure;

@end
