//
//  ViewController.m
//  KVCExpample
//
//  Created by Ildar Zalyalov on 19.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

#import "Jedy.h"

static void *jedyM = &jedyM;
static void *jedyModel2 = &jedyModel2;

@interface ViewController ()
@property (nonatomic, strong) Jedy *jedyModel;
@property (nonatomic, strong) Jedy *jedyModel2;
@end

@implementation ViewController
@synthesize jedyModel = jedyModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    jedyModel = [Jedy new];
    _jedyModel2 = [Jedy new];
    
    jedyModel.jedyBaby = [Jedy new];
    
    [jedyModel setValue:@"askdjaksjdnkjsa" forKeyPath:@"jedyBaby.name"];
    [jedyModel setValue:@"Obivan" forKey:@"name"];
    [jedyModel setValue:@"Dark" forKey:@"forceSide"];
    [jedyModel setValue:@50 forKey:@"health"];
    [jedyModel printJedy];
}
- (void)dealloc{
    [jedyModel removeObserver:self forKeyPath:@"name"];
    [_jedyModel2 removeObserver:self forKeyPath:@"name"];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [jedyModel removeObserver:self forKeyPath:@"name"];
    [_jedyModel2 removeObserver:self forKeyPath:@"name"];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Jedy model
    [jedyModel addObserver:self forKeyPath:@"dataArr.dataArr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:jedyM];
    [jedyModel addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:jedyM];
     [jedyModel addObserver:self forKeyPath:@"forceSide" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:jedyM];
    
    [jedyModel willChangeValueForKey:@"name"];
    [jedyModel setValue:@"Yoda" forKey:@"name"];
    [jedyModel didChangeValueForKey:@"name"];
    
    [jedyModel setValue:@"Dark" forKey:@"forceSide"];

    [jedyModel.dataArr insertObject:@"SomeStr" inDataArrAtIndex:0];
    [jedyModel.dataArr insertObject:@"SomeStr2" inDataArrAtIndex:1];
    [jedyModel.dataArr insertObject:@"SomeStr3" inDataArrAtIndex:2];
    [jedyModel.dataArr removeObjectFromDataArrAtIndex:0];
    //Jedy model 2
    [_jedyModel2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:jedyModel2];
//    [jedyModel setValue:@"Some name" forKey:@"name"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString: @"segue"]){
        ViewController2 *vc = [segue destinationViewController];
        [vc setValue:jedyModel forKey:@"jedyModel"];
    }
}

#pragma mark - Observ

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (context == jedyM) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"\nFirst Jedy name: %@",change);
        }
        if ([keyPath isEqualToString:@"forceSide"]) {
            NSLog(@"\nFirst Jedy forceSide: %@",change);
        }
        if ([keyPath isEqualToString:@"dataArr.dataArr"]) {
            NSLog(@"\nFirst Jedy data: %@",change);
        }
    }else{
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"\nSecond Jedy name: %@",change);
        }
    }
}

@end
