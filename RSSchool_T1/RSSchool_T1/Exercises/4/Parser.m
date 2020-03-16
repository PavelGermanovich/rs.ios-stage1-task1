#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString *openedParantheses = @"(";
    NSString *closedParantheses = @")";
    NSString *openedSquareBracket = @"[";
    NSString *closedSquareBracket = @"]";
    NSString *openedAngleBracket = @"<";
    NSString *closedAngleBracket = @">";
    
    NSMutableArray<NSString*> *resultArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [string length]; i++) {
        if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: openedParantheses]) {
            NSString *returnedElement = [self returnElementFromString:string insideOpenedBracket:openedParantheses byIndexOfChar:i andClosedBracket:closedParantheses];
            if (![returnedElement isEqual:nil]) {
                [resultArray addObject:returnedElement];
            }
        }
        else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: openedSquareBracket]) {
            NSString *returnedElement = [self returnElementFromString:string insideOpenedBracket:openedSquareBracket byIndexOfChar:i andClosedBracket:closedSquareBracket];
            if (![returnedElement isEqual:nil]) {
                [resultArray addObject:returnedElement];
            }
        }
        else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: openedAngleBracket]) {
            NSString *returnedElement = [self returnElementFromString:string insideOpenedBracket:openedAngleBracket byIndexOfChar:i andClosedBracket:closedAngleBracket];
            if (![returnedElement isEqual:nil]) {
                [resultArray addObject:returnedElement];
            }
        }
    }
    
    return resultArray;
}

- (NSString*) returnElementFromString: (NSString *)string insideOpenedBracket: (NSString *)openedBracket byIndexOfChar: (int)index  andClosedBracket: (NSString *)closedBracket {
    NSString *openedBracketString = [string substringFromIndex:index+1];
    NSRange rangeLocation = NSMakeRange(NSNotFound, 0);
    int openedBracketSymbolFoundBeforeCount = 0;
    
    for (int j = 0; j < [openedBracketString length]; j++) {
        if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:openedBracket]) {
            openedBracketSymbolFoundBeforeCount++;
        }
        if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:closedBracket]) {
            if (openedBracketSymbolFoundBeforeCount != 0) {
                openedBracketSymbolFoundBeforeCount--;
                continue;
            }
            else {
                rangeLocation = NSMakeRange(index + 1, j);
                break;
            }
        }
    }
    
    if (rangeLocation.location != NSNotFound) {
        return [string substringWithRange: rangeLocation];
    }
    else {
        return nil;
    }
}

@end
