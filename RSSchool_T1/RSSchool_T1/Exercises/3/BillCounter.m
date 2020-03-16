#import "BillCounter.h"

static NSString *goodAppetite = @"Bon Appetit";

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int sumOfAllDishes = 0;
    for(NSNumber *dish in bill) {
        sumOfAllDishes += [dish intValue];
    }
    
    //sum of money which should be charged from person
    float properGivenSum = (sumOfAllDishes - [[bill objectAtIndex:index] floatValue]) / 2;
    
    if ([sum intValue] == properGivenSum) {
        return goodAppetite;
    }
    else {
        //return amount of money which Bill owes, if sum should be float, than return 1 decimal after dot
        return (properGivenSum - (int)properGivenSum) > 0 ? [NSString stringWithFormat:@"%.1f", [sum intValue] - properGivenSum] :  [NSString stringWithFormat:@"%.f", [sum intValue] - properGivenSum];
    }
}

@end
