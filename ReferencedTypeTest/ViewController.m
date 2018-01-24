//
//  ViewController.m
//  ReferencedTypeTest
//
//  Created by Perfect on 2018/1/24.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "MyString.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *nsStrings;
@property (nonatomic, strong) NSMutableArray *myStrings;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Print out original array:
    [self printOutArray:self.nsStrings];
    [self printOutArray:self.myStrings];
    
    NSMutableArray *nsStringsCopy = self.nsStrings;
    NSMutableArray *myStringsCopy = self.myStrings;
    
    // Modify array:
    [self modifyArray:self.nsStrings];
    [self modifyArray:self.myStrings];
    
    // Print out modified NSString array:
    [self printOutArray:self.nsStrings];
    [self printOutArray:nsStringsCopy];
    
    // Print out modified MyString array:
    [self printOutArray:self.myStrings];
    [self printOutArray:myStringsCopy];
}

#pragma mark - Tools
- (void)modifyArray:(NSMutableArray *)modifyArray {
    if(!modifyArray.count){
        return;
    }
    
    id string = [modifyArray firstObject];
    if([string isKindOfClass:[MyString class]]) {
        MyString *myString = (MyString *)string;
        myString.title = @"XXX";
    }else {
        NSString *string = (NSString *)string;
        string = @"AAA";
    }
}

- (void)printOutArray:(NSArray *)printArray {
    if(!printArray.count){
        return;
    }
    
    for(id string in printArray){
        if([string isKindOfClass:[MyString class]]) {
            MyString *myString = (MyString *)string;
            NSLog(@"My: %@", myString.title);
        }else {
            NSLog(@"NS: %@", (NSString *)string);
        }
    }
}

#pragma mark - Lazy loading
- (NSMutableArray *)nsStrings {
    if(!_nsStrings){
        _nsStrings = [[NSMutableArray alloc] init];
        NSString *aStr = @"aaa";
        [_nsStrings addObject:aStr];
        
        NSString *bStr = @"bbb";
        [_nsStrings addObject:bStr];
        
        NSString *cStr = @"ccc";
        [_nsStrings addObject:cStr];
        
    }
    return _nsStrings;
}

- (NSMutableArray *)myStrings {
    if(!_myStrings){
        _myStrings = [[NSMutableArray alloc] init];
        MyString *aStr = [[MyString alloc] init];
        aStr.title = @"xxx";
        [_myStrings addObject:aStr];
        
        MyString *bStr = [[MyString alloc] init];
        bStr.title = @"yyy";
        [_myStrings addObject:bStr];
        
        MyString *cStr = [[MyString alloc] init];
        cStr.title = @"zzz";
        [_myStrings addObject:cStr];
    }
    return _myStrings;
}

@end
