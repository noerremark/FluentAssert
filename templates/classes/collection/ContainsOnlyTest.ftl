<#--
  - Copyright (c) 2021, salesforce.com, inc.
  - All rights reserved.
  - SPDX-License-Identifier: BSD-3-Clause
  - For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
-->
<#import "../../common/apex-class.ftl" as com>

<#assign numberDataTypes = [
    {"nativeDataType":"List", "castingValue": "List<Object>"},
    {"nativeDataType":"Set",  "castingValue": "Set<Object>"}
]>
<@pp.dropOutputFile />
<#list numberDataTypes as numberDataType>
  <@com.apexClass className="${classPrefix}${numberDataType.nativeDataType}ContainsOnlyTest" path="/classes/${numberDataType.nativeDataType?lower_case}/"/>
@IsTest
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
public class ${classPrefix}${numberDataType.nativeDataType}ContainsOnlyTest {
    private static final ${numberDataType.castingValue} EMPTY = new ${numberDataType.castingValue}();
    private static final ${numberDataType.castingValue} ABC = new ${numberDataType.castingValue} {
        'A', 'B', 'C'
    };

    @IsTest
    static void testPositiveScenarios() {
        FluentAssert.that(ABC)
                    .containsOnly(new List<String>{'C', 'B', 'A'})
                    .containsOnly(new List<String>{'A', 'A', 'B', 'C', 'C'});

        FluentAssert.that(new ${numberDataType.castingValue}{'A', 'A', 'B', 'B'})
                    .containsOnly(new List<String>{'A', 'B'})
                    .containsOnly(new List<String>{'A', 'A', 'B', 'B'});
    }

    @IsTest
    static void testNegativeScenarios() {
        failureScenario(ABC, new List<String>{'A', 'B'});
        failureScenario(ABC, new List<String>{'A', 'B', 'C', 'D'});
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void failureScenario(${numberDataType.castingValue} actual, List<String> expected) {
        try {
            FluentAssert.that(actual).containsOnly(expected);
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
        validationScenario(null, new List<Object>{'A'});
        validationScenario(ABC, (List<Object>) null);

        // Empty inputs throws IllegalArgumentException
        try {
            FluentAssert.that(ABC).containsOnly(new List<Object>());
            System.assert(false, 'No assert exception thrown');
        } catch(IllegalArgumentException iae) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, iae);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(${numberDataType.castingValue} actual, List<Object> expected) {
        try {
            FluentAssert.that(actual).containsOnly(expected);
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
</#list>