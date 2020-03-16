#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int numberOfElementsToTake = (int)array.count - 1;
    
    //sort array
    NSArray<NSNumber*>* sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    int minSum = 0;
    int maxSum = 0;
    for (int i =0; i < sortedArray.count; i++) {
        if (i < numberOfElementsToTake) {
            minSum += [[sortedArray objectAtIndex:i] intValue];
        }
        
        if (i >= sortedArray.count - numberOfElementsToTake) {
            maxSum += [[sortedArray objectAtIndex:i] intValue];
        }
    }
    
    NSArray<NSNumber*> *resultArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minSum], [NSNumber numberWithInt:maxSum], nil];
    return resultArray;
}

@end
