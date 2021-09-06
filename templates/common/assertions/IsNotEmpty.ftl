<#--
  - Copyright (c) 2021, salesforce.com, inc.
  - All rights reserved.
  - SPDX-License-Identifier: BSD-3-Clause
  - For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
-->
    /**
     * @description Verifies that the actual of values is not empty.
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual is null
     * @throws AssertException if actual is empty
     */
    global ${supportedAssert.type?keep_before('<')}Assert isNotEmpty() {
        notNull(actual, 'actual');
        assert(!actual.isEmpty(), 'Was expecting actual list not to be empty but found {0}', new List<Object>{actual});
        return this;
    }