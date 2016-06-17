//
//  ViewController.m
//  Calculator
//
//  Created by MF839-016 on 2016. 6. 15..
//  Copyright © 2016년 MF839-016. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"


@interface ViewController ()

@end

@implementation ViewController 
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}
@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator =[[Calculator alloc]init];
}

//-(void) viewWillAppear:(BOOL)animated
//{
//    NSLog(@"viewWillAppear");
//    [self viewWillAppear:animated];
//}
//
//-(void) viewDidAppear:(BOOL)animated
//{
//    NSLog(@"viewDidAppear");
//    [self viewDidAppear:animated];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) processDigit: (int) digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}
- (void) processOp: (char)TheOp
{
    NSString *opStr;
    
    op = TheOp;
    
    switch (TheOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case 'x':
            opStr = @" × ";
            break;
        case '%':
            opStr = @" ÷ ";
            break;
            
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
     [self SetButtonEnabled : NO];
    
    [displayString appendString:opStr];
    display.text = displayString;
}
- (void) storeFracPart
{
    if(firstOperand)
    {
        if(isNumerator)
        {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if(isNumerator)
    {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else
    {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

- (IBAction)clickDigit:(id)sender//(UIButton *)sender
{
    //NSNumber *num = [NSNumber numberWithInteger: sender.tag];
    //= [num intValue];
    UIButton *btn = (UIButton *)sender;
    int digit = (int)btn.tag;
    [self processDigit:digit];
}

- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:'x'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'%'];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO)
    {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:
         [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        firstOperand = YES;
        isNumerator = YES;
        currentNumber = 0;
        [displayString setString:@""];
        
         [self SetButtonEnabled : YES];
    }
}

- (IBAction)clickClear:(id)sender {
    firstOperand = YES;
    isNumerator = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
    
    [self SetButtonEnabled : YES];


}

- (IBAction)openInfoView:(UIButton *)sender {
    //self.view;
    InfoViewController *infoViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];
    
    infoViewController.delegate = self;
    infoViewController.modalTransitionStyle =
    UIModalTransitionStyleCrossDissolve;//value set
    
    
    infoViewController.myString = self.display.text;
    //@"Hello World!!";
    
    
    [self presentViewController:
     infoViewController
     animated:YES
     completion:nil];//완료된 후 해야 하는 일.. function
}

- (IBAction)openNewView:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"view1" sender:self];//
    
    NSLog(@"view1");
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"Segue ID = %@", segue.identifier);
    if([segue.identifier isEqualToString:@"view1"])
    {
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hello World";
    }
}

- (void) SetButtonEnabled: (BOOL) b
{
//    self.btnDiv.enabled = b;
//    self.btnSub.enabled = b;
//    self.btnPlus.enabled = b;
//    self.btnMulti.enabled = b;
    
    for(int i = 0; i < self.btnOpCollections.count ; i++)
    {
        UIButton *btn = [self.btnOpCollections objectAtIndex:i];
        btn.enabled = b;
    }
}

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender
{
    NSLog(@"unwindToViewController");
}

-(void) changeColor:(UIColor *)newColor
{
    NSLog(@"changeColor");
    
    [self.view setBackgroundColor:newColor];

}
@end
