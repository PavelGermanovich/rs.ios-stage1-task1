#import "T1Array.h"

const static int PIVOT_INDEX = 1;
const static int RIGHT_NEIGHBOR_DISTANCE = 2;

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:sadArray];
    
    while(![self isArrayHappy:result]) {
        result = [self removeIncorrectValueFromSadArray:result];
    }
    
    return result;
}

- (BOOL) isArrayHappy:(NSArray *) arrayToCheck {
    BOOL arrayHapppy = true;
    for ( int i = 0; i < arrayToCheck.count; i++) {
        if (i + RIGHT_NEIGHBOR_DISTANCE < arrayToCheck.count) {
            int sumOfNeighbors = [[arrayToCheck objectAtIndex:i] intValue] + [[arrayToCheck objectAtIndex:i + RIGHT_NEIGHBOR_DISTANCE] intValue];
            if (sumOfNeighbors < [[arrayToCheck objectAtIndex:i + PIVOT_INDEX] intValue]) {
                arrayHapppy = false;
                break;
            }
        }
    }
    return arrayHapppy;
}

- (NSMutableArray *) removeIncorrectValueFromSadArray:(NSArray *) sadArray {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:sadArray];
    
    for (int i = 0; i < result.count; i++) {
        if (i + RIGHT_NEIGHBOR_DISTANCE < result.count) {
            int sumOfNeighbors = [[result objectAtIndex:i] intValue] + [[result objectAtIndex:i + RIGHT_NEIGHBOR_DISTANCE] intValue];
            if (sumOfNeighbors < [[result objectAtIndex:i + PIVOT_INDEX] intValue]) {
                [result removeObjectAtIndex:i + PIVOT_INDEX];
                break;
            }
        }
    }
    return result;
}

@end
