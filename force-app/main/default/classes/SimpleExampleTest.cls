@isTest
public class SimpleExampleTest {
    
    @isTest
    static void testGetGreeting() {
        // Call the method
        String result = SimpleExample.getGreeting('John');
        
        // Verify the result
        System.assertEquals('Hello, John!', result);
    }
}