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
            NSString *openedBracketString = [string substringFromIndex:i+1];
            NSRange rangeLocation = NSMakeRange(NSNotFound, 0);
            int openedBracketSymbolFoundBeforeCount = 0;
            
            for (int j = 0; j < [openedBracketString length]; j++) {
                if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:openedParantheses]) {
                    openedBracketSymbolFoundBeforeCount++;
                }
                if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:closedParantheses]) {
                    if (openedBracketSymbolFoundBeforeCount != 0) {
                        openedBracketSymbolFoundBeforeCount--;
                        continue;
                    }
                    else {
                        rangeLocation = NSMakeRange(i + 1, j);
                        break;
                    }
                }
            }
            
            if (rangeLocation.location != NSNotFound) {
                [resultArray addObject: [string substringWithRange: rangeLocation]];
            }
        }
        else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: openedSquareBracket]) {
              NSString *openedBracketString = [string substringFromIndex:i+1];
              NSRange rangeLocation = NSMakeRange(NSNotFound, 0);
              int openedBracketSymbolFoundBeforeCount = 0;
              
              for (int j = 0; j < [openedBracketString length]; j++) {
                  if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:openedSquareBracket]) {
                      openedBracketSymbolFoundBeforeCount++;
                  }
                  if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:closedSquareBracket]) {
                      if (openedBracketSymbolFoundBeforeCount != 0) {
                          openedBracketSymbolFoundBeforeCount--;
                          continue;
                      }
                      else {
                          rangeLocation = NSMakeRange(i + 1, j);
                          break;
                      }
                  }
              }
              
              if (rangeLocation.location != NSNotFound) {
                  [resultArray addObject: [string substringWithRange: rangeLocation]];
              }
        }
        else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: openedAngleBracket]) {
            NSString *openedBracketString = [string substringFromIndex:i+1];
            NSRange rangeLocation = NSMakeRange(NSNotFound, 0);
            int openedBracketSymbolFoundBeforeCount = 0;
                 
            for (int j = 0; j < [openedBracketString length]; j++) {
                if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:openedAngleBracket]) {
                    openedBracketSymbolFoundBeforeCount++;
                }
                
                if ([[openedBracketString substringWithRange:NSMakeRange(j, 1)] isEqual:closedAngleBracket]) {
                    if (openedBracketSymbolFoundBeforeCount != 0) {
                             openedBracketSymbolFoundBeforeCount--;
                             continue;
                         }
                         else {
                             rangeLocation = NSMakeRange(i + 1, j);
                             break;
                         }
                     }
                 }
                 
                 if (rangeLocation.location != NSNotFound) {
                     [resultArray addObject: [string substringWithRange: rangeLocation]];
                 }
        }
    }
    
    return resultArray;
}

@end
