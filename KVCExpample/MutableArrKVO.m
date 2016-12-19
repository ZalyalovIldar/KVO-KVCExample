//
//  MutableArrKVO.m
//  KVCExpample
//
//  Created by Ildar Zalyalov on 19.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "MutableArrKVO.h"

@implementation MutableArrKVO
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArr = [NSMutableArray new];
    }
    return self;
}

#pragma mark -

- (NSUInteger)countOfDataArr{
    return self.dataArr.count;
}
- (id)objectInDataArrAtIndex:(NSUInteger)index{
    return self.dataArr[index];
}
- (void)insertObject:(id)object inDataArrAtIndex:(NSUInteger)index{
    [self.dataArr insertObject:object atIndex:index];
}
- (void)removeObjectFromDataArrAtIndex:(NSUInteger)index{
    [self.dataArr removeObjectAtIndex:index];
}
@end
