<#--
  - Copyright (c) 2021, salesforce.com, inc.
  - All rights reserved.
  - SPDX-License-Identifier: BSD-3-Clause
  - For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
-->
<#import "../../common/apex-class.ftl" as com>

<@pp.dropOutputFile />
<@com.apexClass className="${classPrefix}MapDoesNotContainEntryTest" path="/classes/map/"/>
@IsTest
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
public class ${classPrefix}MapDoesNotContainEntryTest {
    private static final Map<Object, Object> EMPTY = new Map<Object, Object>();
    private static final Map<Object, Object> ABC = new Map<Object, Object>{
        'A' => 'a',
        'B' => 'b',
        'C' => 'c'
    };

    @IsTest
    static void testPositiveScenarios() {
        FluentAssert.that(EMPTY).doesNotContainEntry('A', 'a');
        
        FluentAssert.that(ABC).doesNotContainEntry('A', 'b')
                              .doesNotContainEntry('B', 'a');
    }

    @IsTest
    static void testNegativeScenarios() {
        try {
            FluentAssert.that(ABC).doesNotContainEntry('A', 'a');
            System.assert(false, 'No assert exception thrown');
        } catch(FluentAssert.AssertException ae) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, ae);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }
    }

    @IsTest
    static void testValidations() {
        validationScenario((Map<Object, Object>) null, 'A', 'a');
        validationScenario(ABC, null, 'a');
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Map<Object, Object> actual, Object expectedKey, Object expectedValue) {
        try {
            FluentAssert.that(actual).doesNotContainEntry(expectedKey, expectedValue);
            System.assert(false, 'No assert exception thrown');
        } catch(NullPointerException npe) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, npe);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }
    }
}