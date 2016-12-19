//
//  MutableArrKVO.h
//  KVCExpample
//
//  Created by Ildar Zalyalov on 19.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MutableArrKVO : NSObject
@property (nonatomic, strong) NSMutableArray *dataArr;

- (NSUInteger)countOfDataArr;
- (id)objectInDataArrAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object inDataArrAtIndex:(NSUInteger)index;
- (void)removeObjectFromDataArrAtIndex:(NSUInteger)index;

@end
