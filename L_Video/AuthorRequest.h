//
//  AuthorRequest.h
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface AuthorRequest : NSObject

+ (instancetype)shareAuthorRequest;

- (void)requestAllAuthorWithUrl:(NSString *)url
                        success:(SuccessResponce)success
                        failure:(FailureResponce)failure;
/**
 *  请求所有Dota主播视频
 */
- (void)requestDotaAllAuthorSuccess:(SuccessResponce)success
                            failure:(FailureResponce)failure;

- (void)requestLOLAllAuthorSuccess:(SuccessResponce)success
                           failure:(FailureResponce)failure;


@end
