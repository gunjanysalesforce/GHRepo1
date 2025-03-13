# changes done in file for second commit - change2
# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for CRT starter.
Library                 QVision
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

# Tip: The Settings section is where you define test suite level configuration.
#      Suite Setup and Teardown are actions that happen before and after a test suite run.
#      For first time users, we don't recommend to change them.
#      You may change chrome to firefox should you wish to test your application on Firefox.

*** Test Cases ***

# Tip: Test cases start from here. The structure of a test case is as follows:
#      Name of the test
#          [Documentation]    A short explanation of the test.
#          Test steps
#
#      A new test case starts from the beginning of the line. Each test step starts with four
#      spaces, followed by a QWord, at least four spaces, and its arguments.

# This is demo test case - Open google
#     [Documentation]        sample live demo test. Open Google
#     GoTo                   https://www.google.com
#     TypeText    Search    copado
#     VerifyText            Google Search
#     ClickText             Google Search
#     ClickText    https://www.copado.com

# Test demo testcase
#     [Documentation]    this is sample recording test case
#     ClickText    Products    anchor=Find your spirit animal
#     ClickText    Products    anchor=Find your spirit animal
#     ClickText    Our Story    anchor=Support
#     ClickText    Contact    anchor=Support
#     ClickText    Support
#     ClickText    Products    anchor=Support
#     ClickText    Fur
#     ClickElement    /html[1]/body[1]/div[2]/section[1]/div[1]/ul[1]/li[1]/div[1]/div[1]/a[1]/img[1]
#     ClickText    Support
#     ClickText    Fur

    
Test the home page
    [Documentation]     Go to the web shop, and verify that the slogan text appears on the page.
    Set Library Search Order        QVision    QWeb
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Find your spirit animal

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify the menu items.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Pro Tip: Make sure that when each test case starts, your application is in a well-defined
#          initial state. The test cases above use GoTo with a fixed URL to set the initial
#          application state, but we recommend starting each test case with the dedicated
#          AppState QWord. The test case below starts with AppState Home, where Home is an
#          initial state defined in the Keywords section at the end of the file. More initial
#          states could be defined as needed.

Continue shopping
    [Documentation]     Add a second product to the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    # Check if we've exited the "cart" by looking for text in the footer.
    VerifyText          Fur, Inc.

Failing Test Case
    [Documentation]    This test case always fails
    AppState            Home
    # Try to verify non-existing text with a short timeout
    # Shows an error modal if in LiveTesting
    VerifyText          The animal friendly clothing company    timeout=1s

*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

# Pro Tip: In this Keywords section, you could combine QWords to make your own keywords using
#          the structure shown above. The pro way is to define them in a separate file and import
#          that file under Settings.
