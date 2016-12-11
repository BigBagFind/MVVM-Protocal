//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by 铁拳科技 on 16/8/30.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"


@interface RWTFlickrSearchViewModel : NSObject


// searchText属性表示文本域中显示文本
@property (nonatomic, strong) NSString *searchText;


// title属性表示导航条上的标题。
@property (nonatomic, strong) NSString *title;


// 绑定UI操作的一个类，它包含一个代表了UI操作的结果的信号以及标识操作当前是否被执行的一个状态。
@property (strong, nonatomic) RACCommand *executeSearch;


// 更新初始化方法并将RWTViewModelServices作为一个参数：
// ViewModel，初始化带一个签订协议的对象
- (instancetype)initWithServices:(id<RWTViewModelServices>)services;














@end
