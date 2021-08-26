<#--
  - Copyright (c) 2021, salesforce.com, inc.
  - All rights reserved.
  - SPDX-License-Identifier: BSD-3-Clause
  - For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
-->
<#import "../../common/apex-class.ftl" as com>

<#assign dataTypes = [
    {"native":"Object",  "concreteValue": "'X'",                          "notEqualToValue":"'Y'"},
    {"native":"Date",    "concreteValue": "Date.today()",                 "notEqualToValue":"Date.today().addDays(1)"},
    {"native":"Datetime","concreteValue": "Datetime.now()",               "notEqualToValue":"Datetime.now().addDays(1)"},
    {"native":"Time",    "concreteValue": "Time.newInstance(1, 2, 3, 4)", "notEqualToValue":"Time.newInstance(1, 2, 3, 4).addMilliseconds(1)"},
    {"native":"String",  "concreteValue": "'X'",                          "notEqualToValue":"'Y'"},
    {"native":"Blob",    "concreteValue": "Blob.valueOf('X')",            "notEqualToValue":"Blob.valueOf('Y')"}
]>
<@pp.dropOutputFile />
<#list dataTypes as dataType>
<@com.apexClass className="${classPrefix}${dataType.native}IsEqualToTest" path="/classes/${dataType.native?lower_case}/"/>
@IsTest
public class ${classPrefix}${dataType.native}IsEqualToTest {
    @IsTest
    static void testPassingScenarios() {
        FluentAssert.that((${dataType.native}) ${dataType.concreteValue}).isEqualTo(${dataType.concreteValue});
    }

    @IsTest
    static void testFailureScenarios() {
        failureScenario(${dataType.concreteValue}, ${dataType.notEqualToValue});
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void failureScenario(${dataType.native} actual, ${dataType.native} expected) {
        try {
            FluentAssert.that(actual).isEqualTo(expected);
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
        validationScenario(null, ${dataType.concreteValue});
        validationScenario(${dataType.concreteValue}, null);
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Object actual, Object expected) {
        try {
            FluentAssert.that(actual).IsEqualTo(expected);
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