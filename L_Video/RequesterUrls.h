//
//  RequesterUrls.h
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#ifndef RequesterUrls_h
#define RequesterUrls_h

// Dota全部主播请求URL
#define DotaAllAuthorsRequester_Url @"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"
// Dota单个主播所有视频
#define DotaSingleAuthorsRequester_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/shipin/latest?author=%@&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&limit=50", ID]
//dota 单个视频请求 url
#define DotaSingleVideoRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&type=mp4&vid=%@", ID]



// LOL全部主播请求URL
#define LOLAllAuthorsRequester_Url @"http://api.dotaly.com/lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"
// LOL单个主播所有视频
//lol 单个主播所有视频 url
#define LOLSignleAuthorAllVideosRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/shipin/latest?author=%@&iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&limit=50", ID]




#endif /* RequesterUrls_h */
