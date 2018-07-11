//
//  PPSDefine.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#ifndef PPSDefine_h
#define PPSDefine_h

/*
 common
 */
//设备屏幕大小
#define MAINSCREEN_FRAME   [[UIScreen mainScreen] bounds]
//设备屏幕宽
#define MAINSCREEN_WIDTH  MAINSCREEN_FRAME.size.width
//设备屏幕高
#define MAINSCREEN_HEIGHT MAINSCREEN_FRAME.size.height

#ifdef DEBUG

#define DLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define DLog(...)

#endif

/*
 Home
 */
#define TasksInProgressState    @"InProgress"
#define TasksFinishedState      @"Finished"
#define InProgressTasksTitleKey    @"InProgressTasksTitleKey"
#define FinishedTasksTitleKey      @"FinishedTasksTitleKey"
#define InProgressTasksTitleValue    @"进行中"
#define FinishedTasksTitleValue     @"已完成"
#define InProgressTasksAryKey    @"InProgressTasksAryKey"
#define FinishedTasksAryKey      @"FinishedTasksAryKey"



#endif /* PPSDefine_h */
