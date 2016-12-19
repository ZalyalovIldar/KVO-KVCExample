//
//  Jedy.m
//  KVCExpample
//
//  Created by Ildar Zalyalov on 19.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "Jedy.h"
@interface Jedy ()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *health;
@property (nonatomic, strong) NSString *forceSide;

@end

@implementation Jedy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.health = @100;
        self.dataArr = [MutableArrKVO new];
    }
    return self;
}

- (void)printJedy{
    NSLog(@"\n===Jedy Model=== \nName: %@ \nHealth: %@ \nForceSide: %@ \nJedyBabyName: %@\n==========",self.name, self.health, self.forceSide,self.jedyBaby.name);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}


@end
