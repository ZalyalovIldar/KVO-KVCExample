//
//  Jedy.h
//  KVCExpample
//
//  Created by Ildar Zalyalov on 19.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MutableArrKVO.h"

@interface Jedy : NSObject

@property (nonatomic, strong) Jedy *jedyBaby;
@property (nonatomic, strong) MutableArrKVO *dataArr;

- (void)printJedy;

@end
