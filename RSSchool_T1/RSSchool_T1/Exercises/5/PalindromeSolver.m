#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableString *result = [[NSMutableString alloc] initWithString:s];
    int changesNeedToBecomePalindrome = 0;
    NSString *MAX_DIGIT = @"9";
    
    /*
     Return "-1" if needs more changes than k value
     */
    for (int i = 0; i < s.length/2; i++) {
        if (![[s substringWithRange:NSMakeRange(i, 1)] isEqualToString: [s substringWithRange:NSMakeRange(s.length - (i + 1), 1)]]) {
            changesNeedToBecomePalindrome++;
        }
    }
    
    if (changesNeedToBecomePalindrome <= [k intValue]) {
        if ([k intValue] > changesNeedToBecomePalindrome) {
            
            int availableFreeAttempts = [k intValue] - changesNeedToBecomePalindrome;
            for (int i = 0; i <= s.length/2; i++) {
                
                NSString *firstDigit = [s substringWithRange:NSMakeRange(i, 1)];
                NSInteger mirrorDigitIndex = s.length - i - 1;
                NSString *reversedDigit = [s substringWithRange:NSMakeRange(mirrorDigitIndex, 1)];
                
                //выйти из цикла for, если нет доступных попыток изменения чисел
                if (availableFreeAttempts == 0) {
                    break;
                }
                
                //if it`s middle element, then make it equals 9
                if (s.length % 2 != 0) {
                    NSInteger middleCharIndex = s.length / 2;
                    if (middleCharIndex == i && ![[result substringWithRange:NSMakeRange(i, 1)] isEqualToString:MAX_DIGIT]) {
                        [result replaceCharactersInRange:NSMakeRange(i, 1) withString:MAX_DIGIT];
                        availableFreeAttempts--;
                        continue;
                    }
                }
                
                //if usual and mirror digit not equals then change them on 9 and remove available attempts. We`re removing only one attempt because those numbers not equals and one of the attempts of changing already included in k valuee
                if (![firstDigit isEqualToString:reversedDigit]) {
                    if ([firstDigit isEqualToString:MAX_DIGIT] || [reversedDigit isEqualToString:MAX_DIGIT]) {
                        continue;
                    }
                    else {
                        [result replaceCharactersInRange:NSMakeRange(i, 1) withString:MAX_DIGIT];
                        [result replaceCharactersInRange:NSMakeRange(mirrorDigitIndex, 1) withString:MAX_DIGIT];
                        availableFreeAttempts--;
                        continue;
                    }
                }
                else {
                    if ([firstDigit isEqualToString:MAX_DIGIT]) {
                        continue;
                    }
                    else {
                        if (availableFreeAttempts >= 2) {
                            //if digit and mirror digit are equal then we should change them both if we have attempts, but those attemps are not included in k that`s we need to remove 2 attempts
                            [result replaceCharactersInRange:NSMakeRange(i, 1) withString:MAX_DIGIT];
                            [result replaceCharactersInRange:NSMakeRange(mirrorDigitIndex, 1) withString:MAX_DIGIT];
                            availableFreeAttempts -= 2;
                            continue;
                        }
                    }
                }
            }
        }
        
        NSInteger i = 0;
        NSInteger j = s.length - 1;
        
        //Make array palindrome, only using swapping digits (the greater one)
        while (i < j) {
            int usualDigit = [[result substringWithRange:NSMakeRange(i, 1)] intValue];
            int mirrorDigit = [[result substringWithRange:NSMakeRange(j, 1)] intValue];
            
            if (usualDigit != mirrorDigit) {
                if (usualDigit > mirrorDigit) {
                    [result replaceCharactersInRange:NSMakeRange(j, 1) withString:[NSString stringWithFormat:@"%d", usualDigit]];
                }
                else {
                    [result replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%d", mirrorDigit]];
                }
            }
            i++;
            j--;
        }
        
        return result;
    }
    return @"-1";
}

@end

