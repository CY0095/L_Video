//
//  NetWorkRequest.h
//  Lesson_Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "BaseRequest.h"
// 成功回调
typedef void(^SuccessResponce)(NSDictionary *dic);
// 失败回调
typedef void(^FailureResponce)(NSError *error);

@interface NetWorkRequest : BaseRequest
/**
 *  请求数据
 *
 *  @param url     请求数据的url
 *  @param dic     请求的参数
 *  @param success 成功回调的block
 *  @param failure 失败回调的block
 */
- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parametersDic
       successResponce:(SuccessResponce)success
       failureResponce:(FailureResponce)failure;

- (void)sendDataWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
         successRequest:(SuccessResponce)success
         failureRequest:(FailureResponce)failure;

- (void)sendImageWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
         successRequest:(SuccessResponce)success
         failureRequest:(FailureResponce)failure;


@end
