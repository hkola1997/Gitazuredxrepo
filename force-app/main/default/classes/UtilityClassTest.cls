@isTest
public class UtilityClassTest {

    @isTest
    static void testFormat_Normal() {
        System.assertEquals('TEST', UtilityClass.formatName('test'));
    }

    @isTest
    static void testFormat_WithSpaces() {
        System.assertEquals('TEST', UtilityClass.formatName(' test '));
    }

    @isTest
    static void testFormat_Null() {
        System.assertEquals(null, UtilityClass.formatName(null));
    }
}