//
//  Fraction.m
//  ObjC
//
//  Created by MF839-016 on 2016. 6. 13..
//  Copyright © 2016년 MF839-016. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;
//@synthesize numerator = _numerator, denominator = _denominator;
//{
//    int _numerator;
//    int _denominator;
//}

//-(id)init{
//    self = [super init];
//    if(self){
//
//    }
//    return self;
//}
-(void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

-(void) setTo:(int)n over: (int) d
{
    numerator = n;
    denominator = d;
}

-(double)convertToNum
{
    if(denominator!=0)
        return (double)numerator/denominator;
    else
        return NAN;
}

-(void) reduce
{
    int u = numerator;
    int v = denominator;
    int temp;
    
    while (v != 0) {
        
        temp = u%v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}

-(Fraction *) add: (Fraction *) f
{
    Fraction * result = [[Fraction alloc] init];
    //a/b + c/d = ((a*d)+(b*c)/(b*d)
    result.numerator = (numerator * f.denominator) + (denominator * f.numerator);
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    
    return result;
}
-(Fraction *) mul: (Fraction *) f
{
    Fraction * result = [[Fraction alloc] init];
    //a/b + c/d = ((a*d)+(b*c)/(b*d)
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    
    return result;
}

-(Fraction *) sub: (Fraction *) f
{
    Fraction * result = [[Fraction alloc] init];
    //a/b + c/d = ((a*d)+(b*c)/(b*d)
    result.numerator = (numerator * f.denominator) - (denominator * f.numerator);
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    
    return result;
}
-(Fraction *) div: (Fraction *) f
{
    Fraction * result = [[Fraction alloc] init];
    //a/b + c/d = ((a*d)+(b*c)/(b*d)
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    
    return result;
}

-(NSString *) convertToString
{
    if(numerator == denominator)
        if(numerator == 0)
            return @"0";
        else
            return @"1";
    else if(denominator == 1)
        return [NSString stringWithFormat:@"%i", numerator];
    else
        return [NSString stringWithFormat:@"%i/%i",
                numerator, denominator];
        
}
@end
