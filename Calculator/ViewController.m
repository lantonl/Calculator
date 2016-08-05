//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    Plus,
    Minus,
    Myltiply,
    Divide,
} CalculatorOperators;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (assign, nonatomic) NSInteger operator;
@property (strong) NSMutableArray *digits;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.digits = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touchDigit:(UIButton *)sender {
    
    if (!self.didUserStartTyping) {
        self.result.text = sender.currentTitle;
        self.didUserStartTyping = YES;
    } else {
        self.result.text = [self.result.text stringByAppendingString:sender.currentTitle];
    }
    
}

- (IBAction)touchPlus:(UIButton *)sender {
    self.operator = Plus;
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    NSLog(@"Digits: %@", self.digits);

}

- (IBAction)touchMinus:(UIButton *)sender {
    self.operator = Minus;
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    NSLog(@"Digits: %@", self.digits);

}

- (IBAction)touchMyltiply:(UIButton *)sender {
    self.operator = Myltiply;
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    NSLog(@"Digits: %@", self.digits);

}

- (IBAction)touchDivide:(UIButton *)sender {
    self.operator = Divide;
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    NSLog(@"Digits: %@", self.digits);
    NSLog(@"operator: %ld", (long)self.operator);

}

- (IBAction)touchEquals:(UIButton *)sender {
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    float x = 0;
    float y = 0;
    float result = 0;
    switch (_operator) {
        case Plus:
            x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            result = x + y;
            self.result.text = [NSString stringWithFormat:@"%.0f", result];
            self.didUserStartTyping = NO;
            break;
        case Minus:
            x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            result = y - x;
            self.result.text = [NSString stringWithFormat:@"%.0f", result];
            self.didUserStartTyping = NO;
            break;
        case Myltiply:
            x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            result = x * y;
            self.result.text = [NSString stringWithFormat:@"%.0f", result];
            self.didUserStartTyping = NO;
            break;
        case Divide:
            x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            result = y / x;
            self.result.text = [NSString stringWithFormat:@"%f", result];
            self.didUserStartTyping = NO;
            break;
            
        default:
            break;
    }
    
    [self.digits addObject:self.result.text];
    
}

- (IBAction)touchClear:(UIButton *)sender {
    self.result.text = @"0";
    [self.digits removeLastObject];
    self.didUserStartTyping = NO;

}


@end
