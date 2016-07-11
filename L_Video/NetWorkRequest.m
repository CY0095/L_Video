//
//  NetWorkRequest.m
//  Lesson_Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponce:(SuccessResponce)success
       failureResponce:(FailureResponce)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:url parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
}

- (void)sendDataWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
         successRequest:(SuccessResponce)success
         failureRequest:(FailureResponce)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
}
/**
 *  上传图片
 *
 *  @param url
 *  @param parameterDic
 *  @param uploadImage
 *  @param success
 *  @param failure
 */
- (void)sendImageWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
         successRequest:(SuccessResponce)success
         failureRequest:(FailureResponce)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    /**
     *
     *  formData 上传的东西
     *  UIImageJPEGRepresentation 压缩图片
     *
     *  mimeType 类型
     */
    
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:UIImageJPEGRepresentation(uploadImage, 0.5) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"application/octet-stream"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
    
}



@end
