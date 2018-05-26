//
//  PPSHTTPLink.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/26.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#ifndef PPSHTTPLink_h
#define PPSHTTPLink_h

#define BaseURL         @"http://127.0.0.1:3000/"
#define URLTool(x,y)    [NSString stringWithFormat:@"%@%@%@", BaseURL,x,y]

// 模块
#define API_Options      @"option/"


// 接口
#define options_allOptions     URLTool(API_Options, @"allOptions")

#endif /* PPSHTTPLink_h */
