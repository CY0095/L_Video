//
//  VideoRequest.h
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoRequest : NSObject

+ (instancetype)shareVideoRequest;

- (void)requestDotaSingleAuthorAllVideoWithAuthorID:(NSString *)ID Success:(SuccessResponce)success failure:(FailureResponce)failure;

- (void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponce)success failure:(FailureResponce)failure;

@end
